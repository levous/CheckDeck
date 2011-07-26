//
//  LVModelFormConfigSection.m
//  ModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormConfigSection.h"


@implementation LVModelFormConfigSection
@synthesize sectionTitle, sectionHeaderView, configRows;

- (void)dealloc
{
    [super dealloc];
}

//=========================================================== 
// - (id)init
// default init sets up collections and empty state
//=========================================================== 
- (id)init
{
    self = [super init];
    if (self) {
        configRows = [NSMutableArray array];
    }
    return self;
}



@end
