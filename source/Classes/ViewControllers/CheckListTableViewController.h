//
//  CheckListTableViewController.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CheckListTableViewController : UITableViewController<NSFetchedResultsControllerDelegate, SCTableViewModelDelegate> {
  CDCoreDataManager *coreDataManager;
  NSFetchedResultsController *fetchedResultsController_;
  UITableViewController *detailViewController;
  SCTableViewModel *detailViewModel;
}

@property (retain, nonatomic, readonly) NSFetchedResultsController *fetchedResultsController; 
@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext; 
@property (retain, nonatomic) UITableViewController *detailViewController; 
@property (retain, nonatomic) SCTableViewModel *detailViewModel; 
@end
