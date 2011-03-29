//
//  PlanOverviewViewController.h
//  EducentivePlayground
//
//  Created by Rusty Zarse on 2/16/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LVFetchedResultsControllerTableViewDataSource.h"


@interface PlanOverviewViewController : UIViewController {
  LVFetchedResultsControllerTableViewDataSource *fetchedResultsDataSource;
}
@property(retain, nonatomic) IncentivePlan *plan;
@property(assign, nonatomic) IBOutlet UILabel *planTitleLabel, *rewardTitleLabel, *pointValueLabel, *targetDateLabel, *earnedPointsLabel;
@property(assign, nonatomic) IBOutlet UITableView *accomplishmentsTableView;

@end
