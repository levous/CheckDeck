//
//  InstrumentationController.m
//  IMBills
//
//  Created by Rusty Zarse on 8/18/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "InstrumentationController.h"

@implementation InstrumentationController
+ (void)logWithFormat:(NSString *)formatString, ...
{	
  va_list args;
  va_start(args, formatString);
	NSLogv(formatString,args);
  va_end(args);
}

+ (void)logInfo:(NSString *)message
{	
	[InstrumentationController logWithFormat:message, nil];
}

@end
