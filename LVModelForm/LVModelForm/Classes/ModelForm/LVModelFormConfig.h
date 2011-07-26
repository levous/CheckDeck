//
//  LVModelFormConfig.h
//  ModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVModelFormConfigSection.h"
#import "LVModelFormConfigRow.h"

@interface LVModelFormConfig : NSObject {

}

@property(retain, nonatomic) NSMutableArray *configSections;

- (NSString *)getSomething;
@end
