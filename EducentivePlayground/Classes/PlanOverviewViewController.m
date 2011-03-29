//
//  PlanOverviewViewController.m
//  EducentivePlayground
//
//  Created by Rusty Zarse on 2/16/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "PlanOverviewViewController.h"


@implementation PlanOverviewViewController
@synthesize planTitleLabel, rewardTitleLabel, pointValueLabel, targetDateLabel, earnedPointsLabel, accomplishmentsTableView, plan;

- (void)dealloc {
	[fetchedResultsDataSource release];
    [super dealloc];
}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	fetchedResultsDataSource = [[LVFetchedResultsControllerTableViewDataSource alloc] init];
	[fetchedResultsDataSource setCoreDataManager:[EducentiveCoreDataManager instance]];
	[fetchedResultsDataSource setFetchedEntityName:@"IncentiveAccomplishment"];
	[fetchedResultsDataSource sortByFieldKeyPath:@"title" ascending:YES];
	[fetchedResultsDataSource setTableViewCellClassXibName:@"IncentiveAccomplishmentTableViewCell"];
	[fetchedResultsDataSource setTableViewCellReuseIdentifier:@"IncentiveAccomplishmentTableViewCell"];
	
	[[self planTitleLabel] setText:[plan title]];
	[[self rewardTitleLabel] setText:[[plan reward] title]];
	[[self pointValueLabel] setText:[NSString stringWithFormat:@"%@", [[plan reward] pointValue]]]; 
	[[self targetDateLabel] setText:[[plan targetDate] description]];
	[[self earnedPointsLabel] setText:@"33"];
	[[self accomplishmentsTableView] setDataSource:fetchedResultsDataSource];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
