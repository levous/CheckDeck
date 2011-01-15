//
//  CustomizationViewController.h
//  Overview App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTableViewModel.h"


@interface CustomizationViewController : UITableViewController < SCTableViewModelDelegate, SCTableViewCellDelegate > {
	
	SCTableViewModel *tableModel;
	
	NSMutableArray *tasksArray;	// Must be a mutable array since the application will add/remove/re-order objects

}

@end
