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


- (NSString *)getSomething{
    return @"something";
}


@end
