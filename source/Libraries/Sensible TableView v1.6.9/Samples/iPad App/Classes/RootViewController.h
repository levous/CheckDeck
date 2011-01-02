//
//  RootViewController.h
//  iPad App
//
//  Copyright Sensible Cocoa 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SCTableViewModel.h"

@class DetailViewController;

@interface RootViewController : UITableViewController <SCTableViewModelDataSource> {
    
    DetailViewController *detailViewController;
    NSManagedObjectContext *managedObjectContext;
	
	SCTableViewModel *tableModel;
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


// Method called by DetailViewController
- (void)addButtonTapped;

@end
