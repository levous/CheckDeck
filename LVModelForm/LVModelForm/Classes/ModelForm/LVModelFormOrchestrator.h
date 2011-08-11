//
//  LVModelFormOrchestrator.h
//  LVModelForm
//
//  Created by Rusty Zarse on 6/27/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVModelFormConfig.h"

@interface LVModelFormOrchestrator : NSObject {
    
}
- (id)initWithClass:(Class)targetClass;
@property(retain, nonatomic) LVModelFormConfig *modelFormConfig;
@end
