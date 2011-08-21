//
//  LVModelFormTableViewDataSourceTests.m
//  LVModelForm
//
//  Created by Rusty Zarse on 8/21/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormTableViewDataSourceTests.h"
#import "LVModelFormTableViewDataSource.h"
#import "ModelFormTester.h"

@implementation LVModelFormTableViewDataSourceTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testDataSourceUsingConfig{
    ModelFormTester *tester = [[ModelFormTester alloc] init];
    LVModelFormConfig *formConfig = [tester basicModelFormConfig];
    
    LVModelFormTableViewDataSource *dataSource = [[LVModelFormTableViewDataSource alloc] init];
    [dataSource setModelFormConfig:formConfig];
    
    NSUInteger rowCountForSection1 = [dataSource tableView:nil numberOfRowsInSection:0];
    NSUInteger rowCountFromModelConfig = [[[[formConfig configSections] objectAtIndex:0] configRows] count];
    STAssertEquals(rowCountFromModelConfig, rowCountForSection1, @"Expected counts to match");

        
}


@end
