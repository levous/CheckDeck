//
//  CheckListItemTableViewCell.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CheckListItemTableViewCell.h"


@implementation CheckListItemTableViewCell
@synthesize titleLabel, checkButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}

#pragma mark -
#pragma mark UI reuseIdentifier

static NSString *reuseIdentifier_ = @"CheckListItemTableViewCell";

+ (NSString *)reuseIdentifier{
	return reuseIdentifier_;
}


- (NSString *)reuseIdentifier{
	return [[self class] reuseIdentifier];
}

#pragma mark -
#pragma mark Properties

- (UILabel *)textLabel{
  return [self titleLabel];
}


#pragma mark -
#pragma mark UI handlers

- (void)checkButtonPressed:(id)sender{
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark -
#pragma mark cleanup


- (void)dealloc {
    [super dealloc];
}


@end
