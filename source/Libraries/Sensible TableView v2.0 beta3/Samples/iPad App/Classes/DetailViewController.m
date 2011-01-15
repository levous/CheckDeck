//
//  DetailViewController.m
//  iPad App
//
//  Copyright Sensible Cocoa 2010. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"


@interface DetailViewController ()

@property (nonatomic, retain) UIPopoverController *popoverController;

- (void)addButtonTapped;

@end



@implementation DetailViewController

@synthesize addButtonItem;
@synthesize popoverController;
@synthesize rootViewController;

#pragma mark -
#pragma mark Private Methods

- (void)addButtonTapped
{
	[self.rootViewController addButtonTapped];
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	self.addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped)];
	self.navigationItem.rightBarButtonItem = self.addButtonItem;
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.popoverController = nil;
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
	[rootViewController release];
    [popoverController release];
    [addButtonItem release];
    
	[super dealloc];
}	


#pragma mark -
#pragma mark Split view support

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
    
    barButtonItem.title = @"Tasks";
    self.navigationItem.leftBarButtonItem = barButtonItem;
	
    self.popoverController = pc;
}


// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
	self.navigationItem.leftBarButtonItem = nil;
	
	self.popoverController = nil;
}


#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
}



@end
