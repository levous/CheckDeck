//
//  CDCoreDataManager.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "LVCoreDataManager.h"

#import "SimpleModelPrototypes.h"

#import "CheckListItem.h"
#import "CheckListItemGroup.h"
#import "CheckList.h"
#import "CheckListItemReview.h"
#import "CheckListReview.h"

@interface CDCoreDataManager : LVCoreDataManager {
@private
  NSFetchedResultsController *fetchedResultsControllerForCheckListItems_;
}
- (NSFetchedResultsController *)getFetchResultsControllerForCheckListReview;

+ (CDCoreDataManager *)instance;
@end
