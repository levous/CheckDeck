//
//  LogEntryListViewController.h
//  Chronicler
//
//  Created by Rusty Zarse on 5/1/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LVFetchedResultsControllerTableViewDataSource.h"

@interface LogEntryListViewController : UIViewController<UITableViewDelegate, NSFetchedResultsControllerDelegate>{
    
    LVFetchedResultsControllerTableViewDataSource *frcDataSource;
}
@property (nonatomic, retain) IBOutlet LVFetchedResultsControllerTableViewDataSource *frcDataSource;

@end
