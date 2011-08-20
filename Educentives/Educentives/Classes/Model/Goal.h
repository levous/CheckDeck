//
//  Goal.h
//  Educentives
//
//  Created by Rusty Zarse on 8/20/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Goal : NSManagedObject {
@private
}
@property (nonatomic, retain) NSManagedObject *achievementPlan;
@property (nonatomic, retain) NSSet *milestones;
@end

@interface Goal (CoreDataGeneratedAccessors)

- (void)addMilestonesObject:(NSManagedObject *)value;
- (void)removeMilestonesObject:(NSManagedObject *)value;
- (void)addMilestones:(NSSet *)values;
- (void)removeMilestones:(NSSet *)values;

@end
