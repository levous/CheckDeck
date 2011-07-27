//
//  LVModelFormConfigSection.h
//  ModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 Corresponds to a section in UITableView
 */
@interface LVModelFormConfigSection : NSObject {
    
}
/**
 Optional title for the section.  
 */
@property(retain, nonatomic) NSString *sectionTitle;
/**
 Optional header view for the section.  When present, overrides sectionTitle
 */
@property(retain, nonatomic) UIView *sectionHeaderView;
/**
 Config rows in this section.  Model Config Cells could,
 potentially, be reused to repeat cells in table.
 */
@property(retain, nonatomic) NSMutableArray *configRows;

@end
