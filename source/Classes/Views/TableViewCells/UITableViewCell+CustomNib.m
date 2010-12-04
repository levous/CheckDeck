//
//  UITableViewCell+CustomNib.h
//  CheckDeck
//
//  Created by Rusty Zarse on 12/4/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "UITableViewCell+CustomNib.h"

@implementation UITableViewCell(CustomNib)


+ (id)loadInstanceOfClass:(Class)class fromNibNamed:(NSString*)nibName withStyle:(UITableViewStyle)style andReuseIdentifier:(NSString *)reuseIdentifier{
  
  UITableViewCell *cell = nil;
  //NSLog( @"nib:%@", nibName );
  NSArray *topLevelObjects;
  @try {
    topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
  }
  @catch (NSException *exception) {
    NSLog(@"UITableViewCell(CustomNib): Caught %@: %@", [exception name], [exception reason]);
  }
  
  for(id currentObject in topLevelObjects) {
    if([currentObject isKindOfClass:class])	{
      cell = currentObject;
      break;
    }
  }
  
  if (cell == nil) {
    cell = [[(UITableViewCell*)[class alloc] initWithStyle:style reuseIdentifier:reuseIdentifier] autorelease];
  }
	
	return cell;
}

+ (id)loadInstanceOfClass:(Class)class fromNibNamed:(NSString*)nibName withReuseIdentifier:(NSString *)reuseIdentifier{
  return [UITableViewCell loadInstanceOfClass:class fromNibNamed:nibName withStyle:UITableViewStylePlain andReuseIdentifier:reuseIdentifier];
}

@end
