//
//  RootViewController.m
//  iPad App
//
//  Copyright Sensible Cocoa 2010. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"

@implementation RootViewController

@synthesize detailViewController, managedObjectContext;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
	
	// Create a class definition for TaskStepEntity
	SCClassDefinition *taskStepDef =
	[SCClassDefinition definitionWithEntityName:@"TaskStepEntity" withManagedObjectContext:managedObjectContext
							  withPropertyNames: [NSArray arrayWithObjects:@"name", @"desc", nil]];
	// Do some property definition customization
	SCPropertyDefinition *tsdescPropertyDef = [taskStepDef propertyDefinitionWithName:@"desc"];
	tsdescPropertyDef.title = @"Description";
	tsdescPropertyDef.type = SCPropertyTypeTextView;
	
	
	// Create a class definition for TaskEntity
	SCClassDefinition *taskDef = 
	[SCClassDefinition definitionWithEntityName:@"TaskEntity" withManagedObjectContext:managedObjectContext
							  withPropertyNames: [NSArray arrayWithObjects:@"name", @"desc", @"dueDate", @"active", @"priority", 
												  @"category", @"taskSteps", nil]];
	// Do some property definition customization
	SCPropertyDefinition *descPropertyDef = [taskDef propertyDefinitionWithName:@"desc"];
	descPropertyDef.title = @"Description";
	descPropertyDef.type = SCPropertyTypeTextView;
	SCPropertyDefinition *priorityPropertyDef = [taskDef propertyDefinitionWithName:@"priority"];
	priorityPropertyDef.type = SCPropertyTypeSegmented;
	priorityPropertyDef.attributes = [SCSegmentedAttributes 
									  attributesWithSegmentTitlesArray:[NSArray arrayWithObjects:@"Low", @"Medium", @"High", nil]];
	SCPropertyDefinition *categoryPropertyDef = [taskDef propertyDefinitionWithName:@"category"];
	categoryPropertyDef.type = SCPropertyTypeSelection;
	categoryPropertyDef.attributes = [SCSelectionAttributes attributesWithItems:[NSArray arrayWithObjects:@"Home", @"Work", @"Other", nil]
														 allowMultipleSelection:NO
															   allowNoSelection:NO];
	SCPropertyDefinition *taskStepsPropertyDef = [taskDef propertyDefinitionWithName:@"taskSteps"];
	taskStepsPropertyDef.attributes = [SCArrayOfObjectsAttributes attributesWithObjectClassDefinition:taskStepDef
																					 allowAddingItems:TRUE
																				   allowDeletingItems:TRUE
																					 allowMovingItems:FALSE];
	
	// Instantiate the tabel model
	tableModel = [[SCTableViewModel alloc] initWithTableView:self.tableView withViewController:self];
	
	// Create and add the objects section
	SCArrayOfObjectsSection *objectsSection = [SCArrayOfObjectsSection sectionWithHeaderTitle:nil
																	withEntityClassDefinition:taskDef];
	objectsSection.itemsAccessoryType = UITableViewCellAccessoryNone;
	[tableModel addSection:objectsSection];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.    
    return YES;
}

- (void)dealloc {
    
    [detailViewController release];
        
    [super dealloc];
}


- (void)addButtonTapped
{
	SCArrayOfObjectsSection *objectsSection = (SCArrayOfObjectsSection *)[tableModel sectionAtIndex:0];
	[objectsSection dispatchAddNewItemEvent];
}


#pragma mark -
#pragma mark SCTableViewModelDataSource methods

// Return a custom detail model that will be used instead of Sensible TableView's auto generated one
- (SCTableViewModel *)tableViewModel:(SCTableViewModel *)tableViewModel
	customDetailTableViewModelForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SCTableViewModel *detailModel = [SCTableViewModel tableViewModelWithTableView:self.detailViewController.tableView
															   withViewController:self.detailViewController];
	return detailModel;
}

@end
