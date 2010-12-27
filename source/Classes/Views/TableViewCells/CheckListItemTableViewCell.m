//
//  CheckListItemTableViewCell.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CheckListItemTableViewCell.h"


@implementation CheckListItemTableViewCell

@synthesize titleLabel, checkButton, checkListItem;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib{
  [[self contentView]setBackgroundColor:[UIColor yellowColor]];
}


#pragma mark -
#pragma mark UI reuseIdentifier

static NSString *reuseIdentifier_ = @"CheckListItemTableViewCell";

+ (NSString *)reuseIdentifier{
	return reuseIdentifier_;
}


- (NSString *)reuseIdentifier{
	return [[[self class] reuseIdentifier] copy];
}

#pragma mark -
#pragma mark Properties

- (UILabel *)textLabel{
  return [self titleLabel];
}


#pragma mark -
#pragma mark UI handlers

- (void)checkButtonPressed:(id)sender{
  [UIView beginAnimations:@"checkTouch" context:nil];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationDidStopSelector:@selector(checkTouchAnimationDidStop:finished:context:)];
  [checkButton setAlpha:0.0];
  [UIView commitAnimations];
}

- (void)checkTouchAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
  [UIView beginAnimations:@"checkTouch2" context:nil];
  [checkButton setAlpha:1.0];
  [checkButton setImage:[UIImage imageNamed:@"Checked.png"] forState:UIControlStateNormal];
  [UIView commitAnimations];
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
