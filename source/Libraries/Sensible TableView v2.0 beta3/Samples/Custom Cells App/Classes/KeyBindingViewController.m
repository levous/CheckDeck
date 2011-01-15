//
//  KeyBindingViewController.m
//  Custom Cells App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import "KeyBindingViewController.h"


@implementation KeyBindingViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Instantiate the tabel model
    tableModel = [[SCTableViewModel alloc] initWithTableView:self.tableView withViewController:self];
	
	// Create a section to hold the different key-bound cells
	SCTableViewSection *section = [SCTableViewSection section];
	[tableModel addSection:section];
	
	NSDictionary *contactDataBindings = [NSDictionary 
										 dictionaryWithObjects:[NSArray arrayWithObjects:@"firstName", @"lastName", @"age", @"sex", nil] 
										 forKeys:[NSArray arrayWithObjects:@"1", @"2", @"3", @"4", nil]]; // 1,2,3,4 are the control tags
	SCControlCell *contactDataCell = [SCControlCell cellWithText:nil withKeyBindings:contactDataBindings withNibName:@"ContactDataCell"];
	[section addCell:contactDataCell];
	
	SCDateCell *dateCell = [SCDateCell cellWithText:@"Birth Date" withBoundKey:@"birthDate" withDateValue:nil];
	[section addCell:dateCell];
	
	SCTextViewCell *notesCell = [SCTextViewCell cellWithText:@"Notes" withBoundKey:@"notes" withTextViewTextValue:nil];
	[section addCell:notesCell];
}



- (void)dealloc {
    [super dealloc];
}


#pragma mark -
#pragma mark SCTableViewModelDelegate methods

- (void)tableViewModel:(SCTableViewModel *)tableViewModel valueChangedForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *firstName = [tableViewModel.modelKeyValues valueForKey:@"firstName"];
	NSString *lastName = [tableViewModel.modelKeyValues valueForKey:@"lastName"];
	NSNumber *age = [tableViewModel.modelKeyValues valueForKey:@"age"];
	NSNumber *sex = [tableViewModel.modelKeyValues valueForKey:@"sex"];
	NSDate *birthDate = [tableViewModel.modelKeyValues valueForKey:@"birthDate"];
	NSString *notes = [tableViewModel.modelKeyValues valueForKey:@"notes"];
	
	// Log key changes to the console
	NSLog(@"\nFirst Name:%@\nLast Name:%@\nAge:%@\nSex:%@\nBithDate:%@\nNotes:%@", 
		  firstName, lastName, age, sex, birthDate, notes);
}


@end

