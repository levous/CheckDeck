//
//  ModelFormTester.h
//  LVModelForm
//
//  Created by Rusty Zarse on 7/26/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVModelFormConfig.h"

@interface ModelFormTester : NSObject {
    
}

- (LVModelFormConfigSection *)basicSection;
- (LVModelFormConfigSection *)basicRow;
- (LVModelFormConfig *)basicModelFormConfig;

@end
