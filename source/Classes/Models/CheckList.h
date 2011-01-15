//
//  CheckList.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/7/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckListItemGroup;
@class CheckListReview;
@class Schedule;

@interface CheckList :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) CheckListReview * checkListReviews;
@property (nonatomic, retain) NSSet* checkListGroups;
@property (nonatomic, retain) NSSet* schedules;

@end


@interface CheckList (CoreDataGeneratedAccessors)
- (void)addCheckListGroupsObject:(CheckListItemGroup *)value;
- (void)removeCheckListGroupsObject:(CheckListItemGroup *)value;
- (void)addCheckListGroups:(NSSet *)value;
- (void)removeCheckListGroups:(NSSet *)value;

- (void)addSchedulesObject:(Schedule *)value;
- (void)removeSchedulesObject:(Schedule *)value;
- (void)addSchedules:(NSSet *)value;
- (void)removeSchedules:(NSSet *)value;

@end

