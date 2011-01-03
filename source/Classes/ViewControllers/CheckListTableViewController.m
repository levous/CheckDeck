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
#import "GenericDetailTableViewController.h"

@implementation CheckListTableViewController
@synthesize managedObjectContext, detailViewController, detailViewModel;


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
  styleSheet = (CDStyleSheet *)[CDStyleSheet newDefaultStyleSheet];
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

- (void)viewWillAppear:(BOOL)animated{
  // Not sure of any consistent way to identify that a child navigation has completed.  This is intended to save the 
  //  changes from a detail view
  NSError *error = nil;
  if ([self managedObjectContext] != nil) {
    if ([[self managedObjectContext] hasChanges] && ![[self managedObjectContext] save:&error]) {
      /*
       Replace this implementation with code to handle the error appropriately.
       
       abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
       */
      NSMutableString *message = [[NSMutableString alloc] init];
      [message appendFormat:@"Save Failed: %@", [error localizedDescription]];
      NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
      if(detailedErrors != nil && [detailedErrors count] > 0) {
        for(NSError* detailedError in detailedErrors) {
          [message appendFormat:@"  DetailedError: %@", [detailedError userInfo]];
        }
      }
      else {
        [message appendFormat:@"  %@", [error userInfo]];
      }
      
      NSLog(@"Unresolved error \n\n%@", message, nil);
      
      abort();
    } 
  }
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

#pragma mark -
#pragma mark Device rotation orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}



#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // Return the number of sections.
  return [[[self fetchedResultsController] sections] count];
}
/*
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
  return [[self fetchedResultsController] sectionIndexTitles];
}
 */
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  return [[[self fetchedResultsController] sectionIndexTitles] objectAtIndex:section];
}
*/

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  id <NSFetchedResultsSectionInfo> sectionInfo = [[[self fetchedResultsController] sections] objectAtIndex:section];
  NSString *sectionTitle = [sectionInfo name];
  //TODO: use a stylesheet for this config
  UIView *labelContainer = [[[UIView alloc] initWithFrame:CGRectZero] autorelease]; // frame gets set by UITableView
  [labelContainer setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
  [labelContainer autoresizesSubviews];
  [labelContainer setBackgroundColor:[UIColor colorWithPatternImage:[styleSheet detailCellTiledBackgroundImage]]];
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, [tableView frame].size.width, 20)];
  [label setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
  [label setText:sectionTitle];
  [label setTextColor:[styleSheet subHeaderFontColor]];
  [label setFont:[UIFont boldSystemFontOfSize:18.0]];
  [label setShadowColor:[styleSheet subHeaderFontShadowColor]];
  [label setShadowOffset:CGSizeMake(0.6, 0.9)];
  [label setBackgroundColor:[UIColor clearColor]];
  [labelContainer addSubview:label];
  [label release];
  return labelContainer;
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
  [[listItemCell backgroundView] setBackgroundColor:[styleSheet detailCellBackgroundColor]];
  UIView *backView = [[UIView alloc] initWithFrame:[listItemCell frame]];
  [backView setBackgroundColor:[styleSheet detailCellSelectedBackgroundColor]];
  [cell setSelectedBackgroundView:backView];
  [backView release];
 
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // get the checklist item for index path
  CheckListItem *item = (CheckListItem *)[self.fetchedResultsController objectAtIndexPath:indexPath];
  
  // create a generic UITableViewController to use for detail view
  //[self setDetailViewController:[[GenericDetailTableViewController alloc] initWithStyle:UITableViewStyleGrouped]];
  //[(GenericDetailTableViewController *)[self detailViewController] setManagedObjectContext:[self managedObjectContext]];
  [self setDetailViewController:[[SCTableViewController alloc] initWithStyle:UITableViewStyleGrouped ]];
  
  // create a table view model for sensible tableview
  [self setDetailViewModel:[SCTableViewModel tableViewModelWithTableView:[self detailViewController].tableView
                                                      withViewController:[self detailViewController]]];
  
  
  // Create a class definition for CheckListItem
	SCClassDefinition *scClassDef = [SCClassDefinition definitionWithEntityName:@"CheckListItem" 
                                                                  withManagedObjectContext:[self managedObjectContext]
                                                           autoGeneratePropertyDefinitions:YES];
  
  // Create an SCObjectSection for the detail model
  SCObjectSection *objectSection = [SCObjectSection sectionWithHeaderTitle:nil
                                                           withBoundObject:item withClassDefinition:scClassDef];
  
  // add the section to the tableview controller's table model
  [[self detailViewModel] addSection:objectSection];
  
  // set right bar button item (not needed)
  /*UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] 
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
                                     target:self 
                                     action:@selector(doneButtonAction)];
  
  [[[self detailViewController] navigationItem] setRightBarButtonItem:doneButton];
  [doneButton release];*/
  
  // Push the detail view normally here (assuming self is within a UINavigationController)
  [self.navigationController pushViewController:[self detailViewController] animated:TRUE];
}




#pragma mark -
#pragma mark fetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController{
  if (fetchedResultsController_ == nil) {
    fetchedResultsController_ = [coreDataManager getFetchResultsControllerForCheckListItems];
    [fetchedResultsController_ setDelegate:self];
  }
  return fetchedResultsController_;
}

#pragma mark NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
  [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
  
  switch(type) {
    case NSFetchedResultsChangeInsert:
      [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                    withRowAnimation:UITableViewRowAnimationFade];
      break;
      
    case NSFetchedResultsChangeDelete:
      [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                    withRowAnimation:UITableViewRowAnimationFade];
      break;
    case NSFetchedResultsChangeUpdate:
      break;
      
  }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
  
  UITableView *tableView = self.tableView;
  
  switch(type) {
      
    case NSFetchedResultsChangeInsert:
      [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      break;
      
    case NSFetchedResultsChangeDelete:
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      break;
      
    case NSFetchedResultsChangeUpdate:
      [self configureCell:[tableView cellForRowAtIndexPath:indexPath]
              atIndexPath:indexPath];
      break;
      
    case NSFetchedResultsChangeMove:
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      break;
  }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
  [self.tableView endUpdates];
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
  [self setDetailViewController:nil];
  if (fetchedResultsController_ && [fetchedResultsController_ delegate] == self) {
    [fetchedResultsController_ setDelegate:nil];
  }
    [super dealloc];
}


@end

