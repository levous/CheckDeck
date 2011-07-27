//
//  LVTableViewCellControllerTests.m
//  LVModelForm
//
//  Created by Rusty Zarse on 7/26/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVTableViewCellControllerTests.h"
#import <UIKit/UIKit.h>
#import "LVModelFormConfig.h"
#import "ModelFormTester.h"
#import "LVTableViewCellController.h"

@implementation LVTableViewCellControllerTests
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

- (void)testCellForRowAtIndexPath{
    UITableView *tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0,0,100,100)] autorelease];
    LVTableViewCellController *cellController = [[[LVTableViewCellController alloc] init] autorelease];
    ModelFormTester *tester = [[[ModelFormTester alloc] init] autorelease];
    LVModelFormConfig *modelFormConfig = [tester basicModelFormConfig];
    [cellController setModelFormConfig:modelFormConfig];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [cellController tableView:tableView cellForRowAtIndexPath:indexPath];
    STAssertNotNil(cell, @"Certainly expected a cell");
}

@end
