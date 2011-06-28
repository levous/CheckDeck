//
//  LVModelFormConfig.h
//  ModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LVModelFormConfig : NSObject {
    
}
/**
 Array of LVModelFormConfigSection describing the data set to UI binding
 */
@property(retain, nonatomic) NSMutableArray *configSections;
@end
