//
//  LVModelFormConfigTests.m
//  LVModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormConfigTests.h"
#import "LVModelFormConfig.h"

@implementation LVModelFormConfigTests

- (void)testGetSomething {
    LVModelFormConfig *mfc = [[LVModelFormConfig alloc] init];
    NSString *resultString = [mfc getSomething];
    STAssertNotNil(resultString, @"Expected to get \"something\"" );
    STAssertEquals(resultString, @"something", @"Expected to get \"something\"");
    
}

@end
