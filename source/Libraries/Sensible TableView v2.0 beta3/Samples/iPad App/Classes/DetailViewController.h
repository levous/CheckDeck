//
//  DetailViewController.h
//  iPad App
//
//  Copyright Sensible Cocoa 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class RootViewController;

@interface DetailViewController : UITableViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
    
	RootViewController *rootViewController;
    UIPopoverController *popoverController;
    
	UIBarButtonItem *addButtonItem;
}

@property (nonatomic, assign) IBOutlet RootViewController *rootViewController;

@property (nonatomic, retain) UIBarButtonItem *addButtonItem;

@end
