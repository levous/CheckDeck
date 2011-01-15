//
//  Task.h
//  Sensible App01
//
//  Created by Tarek Sakr on 09/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskStep.h"


@interface Task : NSObject {

	NSString	*name;
	NSString	*description;
	NSDate		*dueDate;
	NSNumber	*active;
	NSNumber	*priority;
	NSNumber	*categoryIndex;
	NSMutableArray *steps;
}

@property (nonatomic, copy) NSString	*name;
@property (nonatomic, copy) NSString	*description;
@property (nonatomic, copy) NSDate		*dueDate;
@property (nonatomic, copy)	NSNumber	*active;
@property (nonatomic, copy) NSNumber	*priority;
@property (nonatomic, copy) NSNumber *categoryIndex;
@property (nonatomic, readonly) NSMutableArray *steps;

- (void)logTask;

@end
