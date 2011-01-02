//
//  PeopleViewController.m
//  Core Data App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import "PeopleViewController.h"
#import "Core_Data_AppAppDelegate.h"


@implementation PeopleViewController

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
	
	// Get managedObjectContext from application delegate
	NSManagedObjectContext *managedObjectContext = [(Core_Data_AppAppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];
	
	// Create a class definition for TaskEntity
	SCClassDefinition *taskDef =
		[SCClassDefinition definitionWithEntityName:@"TaskEntity" withManagedObjectContext:managedObjectContext
								  withPropertyNames:[NSArray arrayWithObjects:@"name", nil]];
	
	// Create a class definition for PersonEntity
	SCClassDefinition *personDef =
		[SCClassDefinition definitionWithEntityName:@"PersonEntity" withManagedObjectContext:managedObjectContext
								  withPropertyNames:[NSArray arrayWithObjects:@"name", @"title", @"tasks", nil]];
	//property definition customization
	SCPropertyDefinition *tasksPropertyDef = [personDef propertyDefinitionWithName:@"tasks"];
	tasksPropertyDef.attributes = [SCArrayOfObjectsAttributes attributesWithObjectClassDefinition:taskDef
																				 allowAddingItems:NO
																			   allowDeletingItems:NO
																				 allowMovingItems:NO];
	((SCArrayOfObjectsAttributes *)tasksPropertyDef.attributes).allowEditingItems = NO;
	
	
	// Instantiate the tabel model
	tableModel = [[SCArrayOfObjectsModel alloc] initWithTableView:self.tableView withViewController:self
										withEntityClassDefinition:personDef];
	tableModel.searchBar = self.searchBar;
	tableModel.searchPropertyName = @"name";
	tableModel.addButtonItem = self.navigationItem.rightBarButtonItem;
	tableModel.autoSortSections = TRUE;
	tableModel.sectionIndexTitles = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
	
	// no need to add any sections as SCArrayOfObjectsModel automatically generates its sections 
	// from the SCTableViewModelDataSource method implemented below
}

- (void)dealloc {
	
	[searchBar release];
	[tableView release];
	
	[tableModel release];
	
    [super dealloc];
}

#pragma mark -
#pragma mark SCTableViewModelDataSource methods

- (NSString *)tableViewModel:(SCArrayOfItemsModel *)tableViewModel sectionHeaderTitleForItem:(NSObject *)item AtIndex:(NSUInteger)index
{
	// Cast not technically neccessary, done just for clarity
	NSManagedObject *managedObject = (NSManagedObject *)item;
	
	NSString *objectName = (NSString *)[managedObject valueForKey:@"name"];
	
	// Return first charcter of objectName
	return [[objectName substringToIndex:1] uppercaseString];
}


@end

