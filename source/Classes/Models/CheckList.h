//
//  CheckList.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/2/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckListItemGroup;
@class Schedule;

@interface CheckList :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSSet* schedules;
@property (nonatomic, retain) NSSet* checkListGroups;

@end


@interface CheckList (CoreDataGeneratedAccessors)
- (void)addSchedulesObject:(Schedule *)value;
- (void)removeSchedulesObject:(Schedule *)value;
- (void)addSchedules:(NSSet *)value;
- (void)removeSchedules:(NSSet *)value;

- (void)addCheckListGroupsObject:(CheckListItemGroup *)value;
- (void)removeCheckListGroupsObject:(CheckListItemGroup *)value;
- (void)addCheckListGroups:(NSSet *)value;
- (void)removeCheckListGroups:(NSSet *)value;

@end

