//
//  ModelFormTester.m
//  LVModelForm
//
//  Created by Rusty Zarse on 7/26/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "ModelFormTester.h"
#import "LVModelFormConfig.h"
#import "LVModelFormConfigSection.h"

@implementation ModelFormTester

- (LVModelFormConfigSection *)basicSection{
    LVModelFormConfigSection *configSection = [[LVModelFormConfigSection alloc] init];
    [configSection setSectionTitle:@"Section 1"];
    [[configSection configRows] addObject:[self basicRow]];
    return [configSection autorelease];
}

- (LVModelFormConfigSection *)basicRow{
    LVModelFormConfigRow *configRow = [[LVModelFormConfigRow alloc] init];
    [configRow setLabelText:@"Label 1"];
    [configRow setPlaceHolderText:@"Placeholder 1"];
    return [configRow autorelease];
}

- (LVModelFormConfig *)basicModelFormConfig{
    LVModelFormConfig *modelFormConfig = [[LVModelFormConfig alloc] init];
    [[modelFormConfig configSections] addObject:[self basicSection]];

    return [modelFormConfig autorelease];
}

@end
