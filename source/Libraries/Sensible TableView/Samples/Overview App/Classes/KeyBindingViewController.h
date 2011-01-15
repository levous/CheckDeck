//
//  KeyBindingViewController.h
//  Overview App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTableViewModel.h"


@interface KeyBindingViewController : UITableViewController <SCTableViewModelDelegate> {
	
	SCTableViewModel *tableModel;

}

@end
