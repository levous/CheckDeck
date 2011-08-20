//
//  AchievementPlan.h
//  Educentives
//
//  Created by Rusty Zarse on 8/20/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Goal, StudentGroup;

@interface AchievementPlan : NSManagedObject {
@private
}
@property (nonatomic, retain) NSSet *goals;
@property (nonatomic, retain) StudentGroup *studentGroup;
@end

@interface AchievementPlan (CoreDataGeneratedAccessors)

- (void)addGoalsObject:(Goal *)value;
- (void)removeGoalsObject:(Goal *)value;
- (void)addGoals:(NSSet *)values;
- (void)removeGoals:(NSSet *)values;

@end
