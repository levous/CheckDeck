//
//  LVModelFormConfigRow.h
//  ModelForm
//
//  Created by Rusty Zarse on 5/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LVModelFormConfigRow : NSObject {
    
}
/**
 Text used when the bound cell uses a label to describe a ui entry field
 */
@property(retain, nonatomic) NSString *labelText;
/**
 Text used as placeholder text in a text entry field
 */
@property(retain, nonatomic) NSString *placeHolderText;
/**
 Key path used to map the bound entity's property for setting and retrieving 
 the value of the ui entry field 
 */
@property(retain, nonatomic) NSString *targetEntityPropertyKeyPath;
/**
 The Class type of the tableview cell bound to the entity property 
 */
- (Class) tableCellClass;

@end
