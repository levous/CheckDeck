//
//  CheckListItemTableViewCell.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CheckListItemTableViewCell.h"
#import "SoundEffects.h"

// these should go elsewhere
// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) ((angle / 180.0) * M_PI)
// above should go elsewhere

@implementation CheckListItemTableViewCell

@synthesize titleLabel, checkButton, checkListItem;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib{
  //[[self contentView]setBackgroundColor:[UIColor yellowColor]];
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
  
  //TODO: move this to shared class.. this is demo only :)
  SoundEffects *sfx = [[SoundEffects alloc] init];
  [sfx playCheckedOffSound];
}

- (void)checkTouchAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
  // The transform matrix
  CGAffineTransform transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
  checkButton.transform = transform;
  [UIView beginAnimations:@"checkTouch2" context:nil];
  [checkButton setAlpha:1.0];
  [checkButton setImage:[UIImage imageNamed:@"Checked.png"] forState:UIControlStateNormal];
  transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
  checkButton.transform = transform;
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
