//
//  LVModelFormOrchestratorTests.m
//  LVModelForm
//
//  Created by Rusty Zarse on 6/27/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormOrchestratorTests.h"
#import "LVModelFormOrchestrator.h"
#import "Frog.h"

@implementation LVModelFormOrchestratorTests

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

- (void)testInitWithClass
{
    
    LVModelFormOrchestrator *orchestrator = [[LVModelFormOrchestrator alloc] initWithClass:[Frog class]];
    //STAssertNil(orchestrator, @"expected table cell class to be nil immediately after init but got %@", cellClass );
}

@end
