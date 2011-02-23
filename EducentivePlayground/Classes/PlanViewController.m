//
//  PlanViewController.m
//  Educentive
//
//  Copyright 2010 Levoud, LLC. All rights reserved.
//

#import "PlanViewController.h"


@implementation PlanViewController


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
	NSManagedObjectContext *managedObjectContext = [(EducentivePlaygroundAppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];
	
	// Create a class definition for IncentiveAccomplishment
	SCClassDefinition *incentiveAccomplishmentDef =
		[SCClassDefinition definitionWithEntityName:@"IncentiveAccomplishment" withManagedObjectContext:managedObjectContext
								  withPropertyNames:[NSArray arrayWithObjects:@"title", @"pointValue", nil]];
	
	// Create a class definition for IncentiveReward
	SCClassDefinition *rewardDef = 
		[SCClassDefinition definitionWithEntityName:@"IncentiveReward" withManagedObjectContext:managedObjectContext
								  withPropertyNames: [NSArray arrayWithObjects:@"title", @"pointValue", nil]];
	
	// Create a class definition for IncentivePlan
	SCClassDefinition *incentivePlanDef =
		[SCClassDefinition definitionWithEntityName:@"IncentivePlan" withManagedObjectContext:managedObjectContext
								  withPropertyNames: [NSArray arrayWithObjects:@"title", @"reward", @"targetDate", @"incentiveAccomplishments", nil]];
	// Do some property definition customization
	SCPropertyDefinition *planTitlePropertyDef = [incentivePlanDef propertyDefinitionWithName:@"title"];
	planTitlePropertyDef.title = @"Title";
	planTitlePropertyDef.type = SCPropertyTypeTextView;
  
  SCPropertyDefinition *planRewardPropertyDef = [incentivePlanDef propertyDefinitionWithName:@"reward"];
  planRewardPropertyDef.attributes = [SCArrayOfObjectsAttributes attributesWithObjectClassDefinition:rewardDef
                                                                                   allowAddingItems:TRUE
                                                                                 allowDeletingItems:TRUE
                                                                                   allowMovingItems:FALSE];
  
  
	//property definition customization
	SCPropertyDefinition *accomplishmentsPropertyDef = [incentivePlanDef propertyDefinitionWithName:@"incentiveAccomplishments"];
	accomplishmentsPropertyDef.attributes = [SCArrayOfObjectsAttributes attributesWithObjectClassDefinition:incentiveAccomplishmentDef
                                                                               allowAddingItems:YES
                                                                             allowDeletingItems:YES
                                                                               allowMovingItems:NO];
	//((SCArrayOfObjectsAttributes *)accomplishmentsPropertyDef.attributes).allowEditingItems = NO;
  
	  
	
	// Instantiate the tabel model
	tableModel = [[SCTableViewModel alloc] initWithTableView:self.tableView withViewController:self];
	
	// Create and add the objects section
	SCArrayOfObjectsSection *objectsSection = [SCArrayOfObjectsSection sectionWithHeaderTitle:nil
																	withEntityClassDefinition:incentivePlanDef];
	objectsSection.addButtonItem = self.navigationItem.rightBarButtonItem;
	[tableModel addSection:objectsSection];
}


- (void)dealloc {
	
    [tableModel release];
	
    [super dealloc];
}


@end
