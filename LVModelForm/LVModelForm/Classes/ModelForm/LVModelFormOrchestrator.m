//
//  LVModelFormOrchestrator.m
//  LVModelForm
//
//  Created by Rusty Zarse on 6/27/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormOrchestrator.h"
#import "MARTNSObject.h"

@implementation LVModelFormOrchestrator
@synthesize modelFormConfig;

- (id)initWithClass:(Class)targetClass{
    if (self == [super init]) {
        
        LVModelFormConfig *mfc = [[LVModelFormConfig alloc] init];
        [self setModelFormConfig:mfc];
        
        // create 1 default section
        LVModelFormConfigSection *section = [[LVModelFormConfigSection alloc] init];
        [[mfc configSections] addObject:section];
        // retained by array so release
        [section release];
        // retained by prop, so release
        [mfc release];
        
        // get properties from class
        NSArray *properties = [targetClass rt_properties];
        // loop props
        for (RTProperty *prop in properties) {
            // create a cfg row for each
            LVModelFormConfigRow *configRow = [[LVModelFormConfigRow alloc] init];
            [configRow setLabelText:[prop name]]; 
            [configRow setTargetEntityPropertyKeyPath:[prop name]];
            //TODO: localize me
            [configRow setPlaceHolderText:[NSString stringWithFormat:@"Enter %@", [prop name]]];
            [[section configRows] addObject:configRow];
        }
        
    }
    return self;
}

@end
