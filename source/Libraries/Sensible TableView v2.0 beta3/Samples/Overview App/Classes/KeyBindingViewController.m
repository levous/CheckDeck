//
//  KeyBindingViewController.m
//  Overview App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import "KeyBindingViewController.h"


@implementation KeyBindingViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	tableModel = [[SCTableViewModel alloc] initWithTableView:self.tableView withViewController:self];
	
	SCTableViewSection *section = [SCTableViewSection sectionWithHeaderTitle:@"Section Header"];
	[tableModel addSection:section];
	
	SCTextFieldCell *textFieldCell = [SCTextFieldCell cellWithText:@"Text" withPlaceholder:@"enter text" 
													  withBoundKey:@"text" withTextFieldTextValue:nil];
	textFieldCell.valueRequired = TRUE;
	[section addCell:textFieldCell];
	SCNumericTextFieldCell *numericCell = [SCNumericTextFieldCell cellWithText:@"Number" withPlaceholder:@"enter integer" 
																  withBoundKey:@"number" withTextFieldTextValue:nil];
	numericCell.allowFloatValue = FALSE;
	numericCell.minimumValue = [NSNumber numberWithInt:5];
	numericCell.maximumValue = [NSNumber numberWithInt:10];
	[section addCell:numericCell];
	[section addCell:[SCSliderCell cellWithText:@"Slider" withBoundKey:@"slider" withValue:[NSNumber numberWithFloat:0.5]]];
	[section addCell:[SCSwitchCell cellWithText:@"Switch" withBoundKey:@"switch" withSwitchOnValue:[NSNumber numberWithBool:TRUE]]];
}




- (void)dealloc {
	[tableModel release];
    [super dealloc];
}


#pragma mark -
#pragma mark SCTableViewModelDelegate methods

- (void)tableViewModel:(SCTableViewModel *) tableViewModel valueChangedForRowAtIndexPath:(NSIndexPath *) indexPath
{
	NSLog(@"\n\n*********** Key Binding Log ***********\n");
	if(tableModel.valuesAreValid)
		NSLog(@"Data is valid!\n");
	else
		NSLog(@"Data is invalid!\n");
	NSLog(@"Value for text: %@\n", [tableModel.modelKeyValues valueForKey:@"text"]);
	NSLog(@"Value for number: %@\n", [tableModel.modelKeyValues valueForKey:@"number"]);
	NSLog(@"Value for slider: %@\n", [tableModel.modelKeyValues valueForKey:@"slider"]);
	NSLog(@"Value for switch: %@\n", [tableModel.modelKeyValues valueForKey:@"switch"]);
}


@end
