//
//  NavigationCoordinator.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "NavigationCoordinator.h"
#import "CDTabBarController.h"

@interface NavigationCoordinator (Private)
- (void)mapViewControllerRoutes;
@end

@implementation NavigationCoordinator
#pragma mark -
#pragma mark Initialization


static NavigationCoordinator* instance_ = nil;
+ (id)instance{
	if( instance_ == nil ){
		instance_ = [[NavigationCoordinator alloc] init];
	}
	
	return instance_;
	
}

- (id)init{
	if( self = [super init] ){
		ttNavigator = [TTNavigator navigator];
		[ttNavigator setPersistenceMode:TTNavigatorPersistenceModeAll];
    UIWindow *launchWindow = [[UIApplication sharedApplication] keyWindow];
    [ttNavigator setWindow:launchWindow];
    [ttNavigator setDelegate:self];
		[self mapViewControllerRoutes];
  }
	return self;
}

#pragma mark -
#pragma mark Routing

- (void)mapViewControllerRoutes{
	
	NSString* const urlpath_tab_root = @"im://tabBar";
  TTURLMap* map = [ttNavigator URLMap];
	// tab bar
	// The tab bar controller is shared, meaning there will only ever be one created.  Loading
	// This URL will make the existing tab bar controller appear if it was not visible.
	[map from:urlpath_tab_root toSharedViewController:[CDTabBarController class]];

}

#pragma mark -
#pragma mark TTNavigatorDelegate

// Returns "nil" if the URL should not be opened.
- (NSURL*)navigator:(TTNavigator*)navigator URLToOpen:(NSURL*)URL {
  // Open every URL unless we're restoring state, then we should be picky
  if (restoringState) {
    NSString *URLAsString = [URL absoluteString];
    // Don't restore these view controllers.  
    if ([URLAsString hasPrefix:@"im://login"]){
      return nil;
    } 
  }
  return URL;
}


@end
