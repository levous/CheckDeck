//
//  ObjectBindingViewController.m
//  Custom Cells App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import "ObjectBindingViewController.h"
#import "Custom_Cells_AppAppDelegate.h"

@implementation ObjectBindingViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    // Set up the edit and add buttons.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
	
	// Get managedObjectContext from application delegate
	NSManagedObjectContext *managedObjectContext = [(Custom_Cells_AppAppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];
	
	// Create a class definition for ContactEntity
	SCClassDefinition *contactDef = 
		[SCClassDefinition definitionWithEntityName:@"ContactEntity" withManagedObjectContext:managedObjectContext
							  withPropertyNames: [NSArray arrayWithObjects:@"birthDate", @"notes", nil]];
	contactDef.titlePropertyName = @"firstName;lastName";	// This line is not needed if ContactOverviewCell is used
	contactDef.keyPropertyName = @"firstName";
	// Do some property definition customization
	SCPropertyDefinition *notesPropertyDef = [contactDef propertyDefinitionWithName:@"notes"];
	notesPropertyDef.type = SCPropertyTypeTextView;
	// Add a custom property that represents a custom cell defined in ContactDataCell.xib
	NSDictionary *contactDataBindings = [NSDictionary 
										 dictionaryWithObjects:[NSArray arrayWithObjects:@"firstName", @"lastName", @"age", @"sex", nil] 
										 forKeys:[NSArray arrayWithObjects:@"1", @"2", @"3", @"4", nil]]; // 1,2,3,4 are the control tags
	SCCustomPropertyDefinition *dataProperty = [SCCustomPropertyDefinition definitionWithName:@"Contact Data"
																		 withuiElementNibName:@"ContactDataCell" 
																		   withObjectBindings:contactDataBindings];
	[contactDef insertPropertyDefinition:dataProperty atIndex:0];
	
	
	// Instantiate the tabel model
	tableModel = [[SCTableViewModel alloc] initWithTableView:self.tableView withViewController:self];
	
	// Create and add the objects section
	SCArrayOfObjectsSection *objectsSection = [SCArrayOfObjectsSection sectionWithHeaderTitle:nil
																	withEntityClassDefinition:contactDef];
	objectsSection.addButtonItem = self.navigationItem.rightBarButtonItem;
	[tableModel addSection:objectsSection];
}


- (void)dealloc {
	[tableModel release];
    [super dealloc];
}


#pragma mark -
#pragma mark SCTableViewModelDataSource methods

- (SCControlCell *)tableViewModel:(SCTableViewModel *)tableViewModel
	  customCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Create & return a custom cell based on the cell in ContactOverviewCell.xib
	NSDictionary *contactOverviewBindings = [NSDictionary 
										 dictionaryWithObjects:[NSArray arrayWithObjects:@"firstName", @"lastName", @"age", nil] 
										 forKeys:[NSArray arrayWithObjects:@"1", @"2", @"3", nil]]; // 1,2,3 are the control tags
	SCControlCell *contactOverviewCell = [SCControlCell cellWithText:nil withBoundObject:nil withObjectBindings:contactOverviewBindings
														 withNibName:@"ContactOverviewCell"];
	
	return contactOverviewCell;
}


#pragma mark -
#pragma mark SCTableViewModelDelegate methods

- (void)tableViewModel:(SCTableViewModel *)tableViewModel 
	detailViewWillAppearForSectionAtIndex:(NSUInteger)index withDetailTableViewModel:(SCTableViewModel *)detailTableViewModel
{
	detailTableViewModel.delegate = self;
	detailTableViewModel.tag = 100;  // just any unique tag to identify the detail model later on
}

- (void)tableViewModel:(SCTableViewModel *)tableViewModel 
	detailViewWillAppearForRowAtIndexPath:(NSIndexPath *)indexPath withDetailTableViewModel:(SCTableViewModel *)detailTableViewModel
{
	detailTableViewModel.delegate = self;
	detailTableViewModel.tag = 100;  // just any unique tag to identify the detail model later on
}

- (void)tableViewModel:(SCTableViewModel *)tableViewModel willConfigureCell:(SCTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(tableViewModel.tag == 100)	// check that the model is the detail model
	{
		if([cell isKindOfClass:[SCDateCell class]])
		{
			// Just some settings to have the cell better suited for selecting birth dates
			SCDateCell *dateCell = (SCDateCell *)cell;
			dateCell.datePicker.datePickerMode = UIDatePickerModeDate;
			NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
			[dateFormatter setDateFormat:@"MMM dd, YYYY"];
			dateCell.dateFormatter = dateFormatter;
			[dateFormatter release];
		}
	}
}

- (void)tableViewModel:(SCTableViewModel *)tableViewModel willDisplayCell:(SCTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(tableViewModel.tag == 0)	// check that the model is the root model
	{
		// prevent default cell text from apprearing (not needed since firstName & lastName are provided via ContactOverviewCell)
		cell.textLabel.hidden = TRUE;
	}
}

@end

