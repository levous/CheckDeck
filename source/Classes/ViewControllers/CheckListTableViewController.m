//
//  CheckListTableViewController.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CheckListTableViewController.h"
#import "UITableViewCell+CustomNib.h"
#import "CheckListItemTableViewCell.h"
@implementation CheckListTableViewController
@synthesize managedObjectContext;


#pragma mark -
#pragma mark View Init

- (id)initWithNibName { 
  if (self = [super initWithNibName:@"CheckListTableViewController" bundle:nil]){ 
  } 
  return self; 
} 

- (id)initWithNavigatorURL:(NSURL*)URL query:(NSDictionary*)query { 
  if (self = [super initWithNibName:@"CheckListTableViewController" bundle:nil]){ 
    /* if(query && [query objectForKey:@"film"]){ 
      self.film = (Film*) [query objectForKey:@"film"]; 
    } */

  } 
  return self; 
} 

- (void)initializeSelf{
  coreDataManager = [CDCoreDataManager instance];
  [self setManagedObjectContext:[coreDataManager managedObjectContext]];
}

#pragma mark -
#pragma mark View lifecycle

- (void)awakeFromNib{
  [self initializeSelf];
}

- (void)viewDidLoad {
  coreDataManager = [CDCoreDataManager instance];
  // set backgrounds
  [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Pearl-gray.jpg"]]];

  [super viewDidLoad];
  
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // Return the number of sections.
  return [[[self fetchedResultsController] sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  id <NSFetchedResultsSectionInfo> sectionInfo = [[[self fetchedResultsController] sections] objectAtIndex:section];
  NSUInteger rowCount = [sectionInfo numberOfObjects];
  return rowCount;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
  CheckListItem *item = (CheckListItem *)[self.fetchedResultsController objectAtIndexPath:indexPath];
  CheckListItemTableViewCell *listItemCell = (CheckListItemTableViewCell *)cell;
  [[listItemCell titleLabel] setText:[item title]];
  [[listItemCell contentView] setBackgroundColor:[UIColor colorWithRed:0.6 green:0.2 blue:0.2 alpha:1.0]];
 
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CheckListItemTableViewCell reuseIdentifier]];
    if (cell == nil) {
      cell = [UITableViewCell loadInstanceOfClass:[CheckListItemTableViewCell class] 
                                     fromNibNamed:@"CheckListItemTableViewCell" 
                                        withStyle:[tableView style] 
                               andReuseIdentifier:[CheckListItemTableViewCell reuseIdentifier]];


    
    }
    [self configureCell:cell atIndexPath:indexPath];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}

#pragma mark -
#pragma mark fetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController{
  if (fetchedResultsController_ == nil) {
    fetchedResultsController_ = [coreDataManager getFetchResultsControllerForCheckListItems];
  }
  return fetchedResultsController_;
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

