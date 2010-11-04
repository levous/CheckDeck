//
//  CheckList.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/27/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Schedule;

@interface CheckList :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSSet* checkListGroups;
@property (nonatomic, retain) NSSet* schedules;

@end


@interface CheckList (CoreDataGeneratedAccessors)
- (void)addCheckListGroupsObject:(NSManagedObject *)value;
- (void)removeCheckListGroupsObject:(NSManagedObject *)value;
- (void)addCheckListGroups:(NSSet *)value;
- (void)removeCheckListGroups:(NSSet *)value;

- (void)addSchedulesObject:(Schedule *)value;
- (void)removeSchedulesObject:(Schedule *)value;
- (void)addSchedules:(NSSet *)value;
- (void)removeSchedules:(NSSet *)value;

@end

