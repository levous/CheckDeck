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

- (id)initWithClass:(Class)targetClass{
    if (self == [super init]) {
        NSArray *properties = [targetClass rt_properties];
        //NSArray *methods = [targetClass rt_methods];
    }
    return self;
}

@end