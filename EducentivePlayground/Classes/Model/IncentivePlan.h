//
//  IncentivePlan.h
//  EducentivePlayground
//
//  Created by Rusty Zarse on 2/26/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class IncentiveAccomplishment;
@class IncentiveReward;

@interface IncentivePlan :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * targetDate;
@property (nonatomic, retain) IncentiveReward * reward;
@property (nonatomic, retain) NSSet* incentiveAccomplishments;

@end


@interface IncentivePlan (CoreDataGeneratedAccessors)
- (void)addIncentiveAccomplishmentsObject:(IncentiveAccomplishment *)value;
- (void)removeIncentiveAccomplishmentsObject:(IncentiveAccomplishment *)value;
- (void)addIncentiveAccomplishments:(NSSet *)value;
- (void)removeIncentiveAccomplishments:(NSSet *)value;

@end

