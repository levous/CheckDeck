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
    
    LVModelFormConfig *config = [orchestrator modelFormConfig];
    STAssertEquals((NSUInteger)1, [[config configSections] count], @"Should have had one section");
    
    LVModelFormConfigSection *section = [[config configSections] objectAtIndex:0];
    STAssertEquals((NSUInteger)4, [[section configRows] count], @"Should have had 4 rows");
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"color", @"species", @"croakSound", @"mostRecentMeal", nil];
    // verify that each prop has a config row
    for (int nameIdx = 0; nameIdx < [nameArray count]; ++nameIdx) {
        NSString *name = [nameArray objectAtIndex:nameIdx];
        BOOL matched = NO;
        for (LVModelFormConfigRow *row in [section configRows]) {
            if ([name compare:[row labelText]] == NSOrderedSame) {
                matched = YES;
                NSLog(@"Matched %@", name);
                break;
            }
        }  
        STAssertTrue(matched, @"Should have matched a row on prom name %@", name);
    }
}

@end
