//
//  ValidationViewController.h
//  Samples App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTableViewModel.h"
#import "Task.h"

@interface ValidationViewController : UITableViewController <SCTableViewCellDelegate> {
	
	SCTableViewModel *tableModel;
	
	Task *myTask;
}

@end
