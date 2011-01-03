//
//  CDStyleSheet.m
//  CheckDeck
//
//  Created by Rusty Zarse on 1/2/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "CDStyleSheet.h"


@implementation CDStyleSheet

+ (LVStyleSheet *)newDefaultStyleSheet{
  return [[CDStyleSheet alloc] init];
}

- (UIColor *)subHeaderFontColor{
  return [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.0];
}

- (UIColor *)subHeaderFontShadowColor{
  return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
}

- (UIColor *)detailCellBackgroundColor{
  return [UIColor colorWithRed:0.6 green:0.2 blue:0.2 alpha:1.0];
}

- (UIColor *)detailCellSelectedBackgroundColor{
  return [UIColor colorWithRed:0.1 green:0.6 blue:0.0 alpha:1.0];
}

- (UIImage *)detailCellTiledBackgroundImage{
  return [UIImage imageNamed:@"Pearl-gray.jpg"];
}

- (void)dealloc {
    [super dealloc];
}


@end
