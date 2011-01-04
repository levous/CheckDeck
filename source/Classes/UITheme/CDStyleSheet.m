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

#pragma mark -
#pragma mark init

- (id)init{
 if (self == [super init]) {
   LVTextStyle *defaultSubHeaderTextStyle = [[LVTextStyle alloc] initWithFont:[UIFont fontWithName:@"Marker Felt" size:20.0]
                                                                 andTextColor:[UIColor blackColor] 
                                                           andBackgroundColor:[UIColor clearColor]
                                                           andTextShadowColor:[UIColor whiteColor] 
                                                          andTextShadowOffset:CGSizeMake(0.5, 0.9) 
                                                                     andAlpha:0.6];
   [self setSubHeaderTextStyle:defaultSubHeaderTextStyle];
   [defaultSubHeaderTextStyle release];
 } 
  return self;
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
