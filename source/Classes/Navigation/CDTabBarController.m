//
//  CDTabBarController.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CDTabBarController.h"
#import <Three20/Three20+Additions.h>

@implementation CDTabBarController
- (void)viewDidLoad {
	[self setTabURLs:[NSArray arrayWithObjects:@"im://patients",
                    @"im://messages",
                    @"im://settings",
                    @"im://crosscovers",
                    nil]];
	
}

@end
