//
//  LVModelFormConfigRowTests.m
//  LVModelForm
//
//  Created by Rusty Zarse on 5/30/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormConfigRowTests.h"


@implementation LVModelFormConfigRowTests
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

- (void)testTableCellClass
{

    LVModelFormConfigRow *row = [[LVModelFormConfigRow alloc] init];
    Class cellClass = [row tableCellClass];
    STAssertNil(cellClass, @"expected table cell class to be nil immediately after init but got %@", cellClass );
}

@end
