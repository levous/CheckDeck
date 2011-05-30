//
//  LVModelFormConfigSection.h
//  ModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LVModelFormConfigSection : NSObject {
    
}
/**
 Config rows in this section.  Model Config Cells could,
 potentially, be reused to repeat cells in table.
 */
@property(retain, nonatomic) NSMutableArray *configRows;
@end
