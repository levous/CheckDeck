//
//  LVModelFormConfigRow.m
//  ModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVModelFormConfigRow.h"

@implementation LVModelFormConfigRow

@synthesize labelText, placeHolderText, targetEntityPropertyKeyPath;

- (Class)tableCellClass
{
    // This is WRONG!  TDD talking.  We'll be returning the class of the cell once we can create one :)
    return [self class];
}
@end
