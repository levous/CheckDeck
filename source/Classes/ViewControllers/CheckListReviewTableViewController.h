//
//  CheckListReviewTableViewController.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckListItemReviewTableViewCell.h"

@class SoundEffects;

@interface CheckListReviewTableViewController : UITableViewController<NSFetchedResultsControllerDelegate, SCTableViewModelDelegate, CheckListItemReviewTableViewCellDelegate> {
  CDCoreDataManager *coreDataManager;
  NSFetchedResultsController *fetchedResultsController_;
  UITableViewController *detailViewController;
  SCTableViewModel *detailViewModel;
  CDStyleSheet *styleSheet;
  //TODO: move this to shared class.. this is demo only :)
  SoundEffects *sfx;
}

@property (retain, nonatomic, readonly) NSFetchedResultsController *fetchedResultsController; 
@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext; 
@property (retain, nonatomic) UITableViewController *detailViewController; 
@property (retain, nonatomic) SCTableViewModel *detailViewModel; 
@property (retain, nonatomic) CheckList *checkList; 
@end
