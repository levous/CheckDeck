//
//  CheckListTableViewTheSCWay.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/3/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CheckListTableViewTheSCWay : UIViewController <SCTableViewModelDataSource> {
  UISearchBar *searchBar;
	UITableView *tableView;
	
	SCArrayOfObjectsModel *tableModel;
}

@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end