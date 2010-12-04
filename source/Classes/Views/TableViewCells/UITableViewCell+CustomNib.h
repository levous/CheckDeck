//
//  UITableViewCell+CustomNib.h
//  CheckDeck
//
//  Created by Rusty Zarse on 12/4/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UITableViewCell(CustomNib)

+ (id)loadInstanceOfClass:(Class)class fromNibNamed:(NSString*)nibName withStyle:(UITableViewStyle)style andReuseIdentifier:(NSString *)reuseIdentifier;
  
@end
