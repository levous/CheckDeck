//
//  CDCoreDataManager.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CDCoreDataManager.h"


@implementation CDCoreDataManager

#pragma mark -
#pragma mark Singleton
static CDCoreDataManager *_sharedInstance;


////////////////////////////////////////////////////////
+ (CDCoreDataManager *)instance{
	if( _sharedInstance == nil ){
		_sharedInstance = [[CDCoreDataManager alloc] init];
	}
	return _sharedInstance;
}


#pragma mark -
#pragma mark Initialization

////////////////////////////////////////////////////////
- (id)init{
	return [self initWithDbName:@"CheckDeckModel.sqlite"];
}



#pragma mark -
#pragma mark CRUD

- (id)insertCheckListItemWithTitle:(NSString *)title{
  CheckListItem *newInstance = (CheckListItem *)[NSEntityDescription insertNewObjectForEntityForName:@"CheckListItem" inManagedObjectContext:[self managedObjectContext]];
  [newInstance setTitle:title];
  return newInstance;
}


- (void)intializeModelWithTestData{
  
  [self insertCheckListItemWithTitle:@"Hello"];
  [self insertCheckListItemWithTitle:@"World"];
	// save
	[self commitPendingChanges:nil];
	
}


#pragma mark -
#pragma mark FetchResultsController

- (NSFetchedResultsController *)getFetchResultsControllerForCheckListItems{
  
  
  if (fetchedResultsControllerForCheckListItems_ != nil) {
    return fetchedResultsControllerForCheckListItems_;
  }
  
  // Set up the fetched results controller.
  
  // Create the fetch request for the entity.
  NSFetchRequest *fetchRequest = [self fetchForEntityNamed:@"CheckListItem"];
  
  // Set the batch size to a suitable number.
  [fetchRequest setFetchBatchSize:20];
  
  // set the filter predicate
  //[fetchRequest setPredicate:[self generatePatientListPredicate]];
  
  // set sort
  [fetchRequest setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"sortOrder" ascending:YES]]];
  
  // Edit the section name key path and cache name if appropriate.
  // nil for section name key path means "no sections".
  /*
   NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext 
   sectionNameKeyPath:[self getPatientListSectionNameKeyPath] // this key defines the sections
   cacheName:nil]; // setting cacheName to nil until we know how to update appropriately on data changes
   
   */
  
  NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext 
                                                                                                sectionNameKeyPath:nil // this key defines the sections
                                                                                                         cacheName:nil]; // setting cacheName to nil until we know how to update appropriately on data changes
  
  
  
  aFetchedResultsController.delegate = self;
  fetchedResultsControllerForCheckListItems_ = aFetchedResultsController;
  //[aFetchedResultsController release];
  
  NSError *error = nil;
  if (![fetchedResultsControllerForCheckListItems_ performFetch:&error]) {
    /*
     Replace this implementation with code to handle the error appropriately.
     
     abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
     */
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  
  return fetchedResultsControllerForCheckListItems_;  
  
}

- (void)dealloc{
  [fetchedResultsControllerForCheckListItems_ release];
  fetchedResultsControllerForCheckListItems_ = nil;
  [super dealloc];
}

@end
