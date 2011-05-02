//
//  LogEntryListViewController.m
//  Chronicler
//
//  Created by Rusty Zarse on 5/1/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LogEntryListViewController.h"
#import "LogEntryViewController.h"


@implementation LogEntryListViewController
@synthesize frcDataSource;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [frcDataSource release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark Bar Button Item action methods

- (void)addLogEntry{
    LogEntryViewController *logEntryViewController = [[LogEntryViewController alloc] initWithNibName:@"LogEntryViewController" bundle:nil];
    [[self navigationController] pushViewController:logEntryViewController animated:YES];
    [logEntryViewController release];
}

#pragma mark -
#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LogEntry *logEntry = [[self frcDataSource] objectAtIndexPath:indexPath];
    LogEntryViewController *logEntryViewController = [[LogEntryViewController alloc] initWithNibName:@"LogEntryViewController" bundle:nil];
    [logEntryViewController setLogEntry:logEntry];
    [[self navigationController] pushViewController:logEntryViewController animated:YES];
    [logEntryViewController release];
}

#pragma mark -
#pragma mark NSFetchedResultsControllerDelegate methods

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    // yes, brute force
    [(UITableView *)[self view] reloadData];
}

#pragma mark -
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"Entries"];
    // set "add" as right bar button item 
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addLogEntry)];
    [[self navigationItem] setRightBarButtonItem:addItem animated:YES];
    [addItem release];

    // set up table view data source
    [[self frcDataSource] setCoreDataManager:[ChroniclerCoreDataManager instance]];
    [[self frcDataSource] setFetchedEntityName:@"LogEntry"];
    [[self frcDataSource] sortByFieldKeyPath:@"createdOn" ascending:NO];
    [[[self frcDataSource] fetchedResultsController] setDelegate:self];
}

- (void)viewDidUnload
{
    [self setFrcDataSource:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
