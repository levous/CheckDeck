//
//  CheckListTableViewController.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CheckListTableViewController : UITableViewController {
  CDCoreDataManager *coreDataManager;
  NSFetchedResultsController *fetchedResultsController_;
}

@property (retain, nonatomic, readonly) NSFetchedResultsController *fetchedResultsController; 
@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext; 
@end
