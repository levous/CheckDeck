//
//  ValidationViewController.m
//  Overview App
//
//  Copyright 2010 Sensible Cocoa. All rights reserved.
//

#import "ValidationViewController.h"


@implementation ValidationViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	SCClassDefinition *taskClassDef = [SCClassDefinition definitionWithClass:[Task class] 
														   withPropertyNames:[NSArray arrayWithObjects:@"name", 
																			  @"dueDate",
																			  @"priority", nil]];
	taskClassDef.uiElementDelegate = self;  // This is to allow "self" to become the delegate of the generated cells
	SCPropertyDefinition *namePropertyDef = [taskClassDef propertyDefinitionWithName:@"name"];
	namePropertyDef.required = TRUE;
	namePropertyDef.autoValidate = FALSE;	// We will provide our own custom validation
	[taskClassDef propertyDefinitionWithName:@"dueDate"].required = TRUE;
	SCPropertyDefinition *priorityPropertyDef = [taskClassDef propertyDefinitionWithName:@"priority"];
	priorityPropertyDef.title = @"Priority (1-10)";
	priorityPropertyDef.type = SCPropertyTypeNumericTextField;
	priorityPropertyDef.attributes = [SCNumericTextFieldAttributes attributesWithMinimumValue:[NSNumber numberWithInt:1] 
																				 maximumValue:[NSNumber numberWithInt:10]
																			  allowFloatValue:NO];
	
	myTask = [[Task alloc] init];
	myTask.name = @"myTask";
	
	tableModel = [[SCTableViewModel alloc] initWithTableView:self.tableView withViewController:self];
	SCTableViewSection *section = [SCTableViewSection sectionWithHeaderTitle:@"Section Header"];
	[tableModel addSection:section];
	
	SCObjectCell *objectCell = [SCObjectCell cellWithBoundObject:myTask withClassDefinition:taskClassDef];
	objectCell.detailViewModal = TRUE;
	[section addCell:objectCell];
}




- (void)dealloc {
	[tableModel release];
	[myTask release];
    [super dealloc];
}


#pragma mark -
#pragma mark SCTableViewCellDelegate methods

- (BOOL)valueIsValidForCell:(SCTableViewCell *) cell
{
	if(cell.tag == 0)	// cell for name property
	{
		SCTextFieldCell *textFieldCell = (SCTextFieldCell *)cell;
		
		// Value is valid only if name starts with "my"
		if([textFieldCell.textField.text length] < 2)
			return FALSE;
		NSString *subString = [textFieldCell.textField.text substringToIndex:2];
		if([subString isEqualToString:@"my"])
			return TRUE;
		//else
		return FALSE;
	}
	//else
	return TRUE;
}


@end
