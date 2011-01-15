//
//  Samples_AppAppDelegate.h
//  Samples App
//
//  Copyright Sensible Cocoa 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Samples_AppAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
