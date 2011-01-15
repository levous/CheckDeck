//
//  PeopleViewController.h
//  Core Data App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTableViewModel.h"

@interface PeopleViewController : UIViewController <SCTableViewModelDataSource> {

	UISearchBar *searchBar;
	UITableView *tableView;
	
	SCArrayOfObjectsModel *tableModel;
}

@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
