//
//  ObjectBindingViewController.h
//  Custom Cells App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTableViewModel.h"

@interface ObjectBindingViewController : UITableViewController <SCTableViewModelDataSource, SCTableViewModelDelegate> {

	SCTableViewModel *tableModel;
}

@end
