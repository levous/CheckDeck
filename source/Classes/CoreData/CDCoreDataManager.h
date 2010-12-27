//
//  CDCoreDataManager.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "LVCoreDataManager.h"
#import "CheckListItem.h"
#import "SimpleModelPrototypes.h"

@interface CDCoreDataManager : LVCoreDataManager {
@private
  NSFetchedResultsController *fetchedResultsControllerForCheckListItems_;
}
- (NSFetchedResultsController *)getFetchResultsControllerForCheckListItems;
+ (CDCoreDataManager *)instance;
@end
