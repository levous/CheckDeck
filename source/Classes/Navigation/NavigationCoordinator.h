//
//  NavigationCoordinator.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NavigationCoordinator : NSObject<TTNavigatorDelegate> {
  TTNavigator *ttNavigator;
  BOOL restoringState;
}

@end
