//
//  Milestone.h
//  Educentives
//
//  Created by Rusty Zarse on 8/23/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Goal;

@interface Milestone : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * fullDescription;
@property (nonatomic, retain) NSDecimalNumber * pointValue;
@property (nonatomic, retain) NSNumber * priorityOrder;
@property (nonatomic, retain) NSDate * targetDate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Goal *goal;

@end
