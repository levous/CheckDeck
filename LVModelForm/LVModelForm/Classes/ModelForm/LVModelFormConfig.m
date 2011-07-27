//
//  LVModelFormConfig.m
//  ModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormConfig.h"


@implementation LVModelFormConfig
@synthesize configSections;

- (void)dealloc{
    [configSections release], configSections = nil;
    [super dealloc];
}

- (id)init{
    if((self = [super init])){
        [self setConfigSections:[NSMutableArray array]];
    }
    return self;
}

#pragma mark - Section/Row Retrieval

- (LVModelFormConfigSection *)configSectionForSectionIdx:(NSInteger)section{
    //NSInteger configSectionCount = [[self configSections] count];
    //LVDASSERT(section < configSectionCount);
    LVModelFormConfigSection *sectionConfig = [[self configSections] objectAtIndex:section];
    return sectionConfig;
}

- (LVModelFormConfigRow *)configRowForIndexPath:(NSIndexPath *)indexPath{
    LVModelFormConfigSection *configSection = [self configSectionForSectionIdx:[indexPath section]];
    LVModelFormConfigRow *configRow = [[configSection configRows] objectAtIndex:[indexPath row]];
    return configRow;
}

- (NSString *)getSomething{
    return @"something";
}

@end
