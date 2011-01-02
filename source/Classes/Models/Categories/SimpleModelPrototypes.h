//
//  SimpleModelPrototypes.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/27/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//
#import "CheckListItem.h"

@interface CheckListItem (SimpleModel)
- (id)createWithTitle:(NSString *)title;
@end
