//
//  Goal.h
//  Educentives
//
//  Created by Rusty Zarse on 8/23/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AchievementPlan, Milestone;

@interface Goal : NSManagedObject {
@private
}
@property (nonatomic, retain) AchievementPlan *achievementPlan;
@property (nonatomic, retain) NSSet *milestones;
@end

@interface Goal (CoreDataGeneratedAccessors)

- (void)addMilestonesObject:(Milestone *)value;
- (void)removeMilestonesObject:(Milestone *)value;
- (void)addMilestones:(NSSet *)values;
- (void)removeMilestones:(NSSet *)values;

@end
