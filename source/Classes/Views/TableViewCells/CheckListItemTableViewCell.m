//
//  CheckListItemTableViewCell.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CheckListItemTableViewCell.h"


@implementation CheckListItemTableViewCell

+ (NSString *)cellIdentifier{
  return @"CheckListItemTableViewCell";
}
- (NSString *)cellIdentifier{
  return [CheckListItemTableViewCell cellIdentifier];
}

@synthesize titleLabel, checkButton;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib{
  [[self contentView]setBackgroundColor:[UIColor yellowColor]];
}


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


- (void)dealloc {
    [super dealloc];
}


@end
