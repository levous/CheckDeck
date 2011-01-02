//
//  GenericDetailTableViewController.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/1/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "GenericDetailTableViewController.h"


@implementation GenericDetailTableViewController
@synthesize managedObjectContext = _managedObjectContext;

#pragma mark -
#pragma mark View lifecycle

- (void)viewWillDisappear:(BOOL)animated{
  NSError *error = nil;
  if ([self managedObjectContext] != nil) {
    if ([[self managedObjectContext] hasChanges] && ![[self managedObjectContext] save:&error]) {
      /*
       Replace this implementation with code to handle the error appropriately.
       
       abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
       */
      NSMutableString *message = [[NSMutableString alloc] init];
      [message appendFormat:@"Bill: %@", [error localizedDescription]];
      NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
      if(detailedErrors != nil && [detailedErrors count] > 0) {
        for(NSError* detailedError in detailedErrors) {
          [message appendFormat:@"  DetailedError: %@", [detailedError userInfo]];
        }
      }
      else {
        [message appendFormat:@"  %@", [error userInfo]];
      }
      
      NSLog(@"Unresolved error \n\n%@", message, nil);
      
      abort();
    } 
  }
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[super dealloc];
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
