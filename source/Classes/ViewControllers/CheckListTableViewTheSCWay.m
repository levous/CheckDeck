//
//  CheckListTableViewTheSCWay.m
//  CheckDeck
//
//  Created by Rusty Zarse on 1/3/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "CheckListTableViewTheSCWay.h"


@implementation CheckListTableViewTheSCWay

@synthesize searchBar;
@synthesize tableView;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
  [super viewDidLoad];
	
  // Set up the edit and add buttons.
  self.navigationItem.leftBarButtonItem = self.editButtonItem;
  
  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
  self.navigationItem.rightBarButtonItem = addButton;
  [addButton release];
	
	// Get managedObjectContext 
	NSManagedObjectContext *managedObjectContext = [[CDCoreDataManager instance] managedObjectContext];
	
	// Create a class definition for CheckListItem
	SCClassDefinition *checkListItemDef =
  [SCClassDefinition definitionWithEntityName:@"CheckListItem" withManagedObjectContext:managedObjectContext
              autoGeneratePropertyDefinitions:YES];
	
	// Create a class definition for CheckListItemGroup
	SCClassDefinition *checkListItemGroup =
  [SCClassDefinition definitionWithEntityName:@"CheckListItemGroup" withManagedObjectContext:managedObjectContext
              autoGeneratePropertyDefinitions:YES];
  
  // associate the group def with the item def
  SCPropertyDefinition *checkListGroupProperty = [checkListItemDef propertyDefinitionWithName:@"checkListGroup"];
  [checkListGroupProperty setType:SCPropertyTypeObject];
  [checkListGroupProperty setTitle:@"Group"];
  [checkListGroupProperty setAttributes:[SCObjectAttributes attributesWithObjectClassDefinition:checkListItemGroup]];
  
  
  // Create a class definition for CheckList
	SCClassDefinition *checkListDef =
  [SCClassDefinition definitionWithEntityName:@"CheckList"
                     withManagedObjectContext:managedObjectContext
              autoGeneratePropertyDefinitions:YES];
   
  // associate the list def with the group def
  SCPropertyDefinition *checkListProperty = [checkListItemGroup propertyDefinitionWithName:@"checkList"];
  [checkListProperty setType:SCPropertyTypeObject];
  [checkListProperty setTitle:@"List"];
  [checkListProperty setAttributes:[SCObjectAttributes attributesWithObjectClassDefinition:checkListDef]];

	
	// Instantiate the table model
	tableModel = [[SCArrayOfObjectsModel alloc] initWithTableView:self.tableView withViewController:self
                                      withEntityClassDefinition:checkListItemDef];
	tableModel.searchBar = self.searchBar;
	tableModel.searchPropertyName = @"title";
	tableModel.addButtonItem = self.navigationItem.rightBarButtonItem;
	tableModel.autoSortSections = TRUE;
	tableModel.sectionIndexTitles = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
	
	// no need to add any sections as SCArrayOfObjectsModel automatically generates its sections 
	// from the SCTableViewModelDataSource method implemented below
}

#pragma mark -
#pragma mark SCTableViewModelDataSource methods

- (SCControlCell *)tableViewModel:(SCTableViewModel *)tableViewModel
      customCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Create & return a custom cell based on the cell in ContactOverviewCell.xib
	NSDictionary *contactOverviewBindings = [NSDictionary 
                                           dictionaryWithObjects:[NSArray arrayWithObjects:@"title", nil] 
                                           forKeys:[NSArray arrayWithObjects:@"1", nil]]; // 1,2,3 are the control tags
	SCControlCell *contactOverviewCell = [SCControlCell cellWithText:nil withBoundObject:nil withObjectBindings:contactOverviewBindings
                                                       withNibName:@"CheckListItemTableViewCell"];
	
	return contactOverviewCell;
}


- (NSString *)tableViewModel:(SCArrayOfItemsModel *)tableViewModel sectionHeaderTitleForItem:(NSObject *)item AtIndex:(NSUInteger)index
{
	// Cast not technically neccessary, done just for clarity
	NSManagedObject *managedObject = (NSManagedObject *)item;
	
	NSString *objectName = (NSString *)[managedObject valueForKey:@"title"];
	
	// Return first charcter of objectName
	return [[objectName substringToIndex:1] uppercaseString];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

