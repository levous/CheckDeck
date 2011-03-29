//
//  EducentiveCoreDataManager.m
//  EducentivePlayground
//
//  Created by Rusty Zarse on 3/1/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "EducentiveCoreDataManager.h"


@implementation EducentiveCoreDataManager

#pragma mark -
#pragma mark Singleton
static EducentiveCoreDataManager *_sharedInstance;


////////////////////////////////////////////////////////
+ (EducentiveCoreDataManager *)instance{
	if( _sharedInstance == nil ){
		_sharedInstance = [[EducentiveCoreDataManager alloc] init];
	}
	return _sharedInstance;
}


#pragma mark -
#pragma mark Initialization

////////////////////////////////////////////////////////
- (id)init{
	return [self initWithDbName:@"EducentivePlayground.sqlite"];
}


@end
