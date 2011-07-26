//
//  LVModelFormConfigTests.m
//  LVModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormConfigTests.h"
#import "LVModelFormConfig.h"
#import "ModelFormTester.h"

@implementation LVModelFormConfigTests

- (void)testGetSomething {
    LVModelFormConfig *mfc = [[LVModelFormConfig alloc] init];
    NSString *resultString = [mfc getSomething];
    STAssertNotNil(resultString, @"Expected to get \"something\"" );
    STAssertEquals(resultString, @"something", @"Expected to get \"something\"");
    
}

- (void)testEmptyConfig{
    LVModelFormConfig *mfc = [[LVModelFormConfig alloc] init];
    STAssertNotNil([mfc configSections], @"Sections array should not be nil" );
    STAssertFalse([[mfc configSections] count], @"Sections should be empty");
    
}

- (void)testBasicConfig{
    ModelFormTester *tester = [[[ModelFormTester alloc] init] autorelease];
    LVModelFormConfig *mfc = [tester basicModelFormConfig];
    STAssertNotNil([mfc configSections], @"Sections array should not be nil" );
    STAssertEquals(1, (int)[[mfc configSections] count], @"1 Section should be present");
    STAssertEquals(1, (int)[[[[mfc configSections] lastObject] configRows] count], @"1 row should be present");
    
} 


@end
