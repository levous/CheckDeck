//
//  CheckListItemGroup.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/7/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckList;
@class CheckListItem;
@class Schedule;

@interface CheckListItemGroup :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet* checkListItems;
@property (nonatomic, retain) CheckList * checkList;
@property (nonatomic, retain) Schedule * schedule;

@end


@interface CheckListItemGroup (CoreDataGeneratedAccessors)
- (void)addCheckListItemsObject:(CheckListItem *)value;
- (void)removeCheckListItemsObject:(CheckListItem *)value;
- (void)addCheckListItems:(NSSet *)value;
- (void)removeCheckListItems:(NSSet *)value;

@end

