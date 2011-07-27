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

/**
 Configuration information used to present a form UI bound to 
 a model class.
 */
@interface LVModelFormConfig : NSObject {

}

/** 
 Corresponds to sections in the UITableView.  Each item contains a collection 
 of rows plus section details  
 */
@property(retain, nonatomic) NSMutableArray *configSections;

/** Retrieves LVModelFormConfigSection found at section index */
- (LVModelFormConfigSection *)configSectionForSectionIdx:(NSInteger)section;
/** Retrieves LVModelFormConfigRow found at index path */
- (LVModelFormConfigRow *)configRowForIndexPath:(NSIndexPath *)indexPath;

@end
