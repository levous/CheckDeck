//
//  CheckListItemReviewTableViewCell.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CheckListItemReviewTableViewCell.h"

// these should go elsewhere
// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) ((angle / 180.0) * M_PI)
// above should go elsewhere

@implementation CheckListItemReviewTableViewCell

@synthesize titleLabel, checkButton, delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib{
  //[[self contentView] setBackgroundColor:[UIColor yellowColor]];
}

#pragma mark -
#pragma mark UI reuseIdentifier

static NSString *reuseIdentifier_ = @"CheckListItemReviewTableViewCell";

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

- (CheckListItemReview *)checkListItemReview{
  return checkListItemReview;
}

- (void)setCheckListItemReview:(CheckListItemReview *)newItem{
  checkListItemReview = newItem;
  [[self titleLabel] setText:[[newItem checkListItem] title]];
  [self updateButtonImageWithAnimation:NO];
}


#pragma mark -
#pragma mark UI handlers

- (void)updateButtonImageWithAnimation:(BOOL)shouldAnimate{
  if (shouldAnimate) {
    // animate change
    [UIView beginAnimations:@"checkTouch" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(checkTouchAnimationDidStop:finished:context:)];
    [checkButton setAlpha:0.0];
    [UIView commitAnimations];
  }else {
    NSString *imageName = ([[[self checkListItemReview] checked] boolValue]) ? @"Checked.png" : @"Unchecked.png";
    [checkButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if ([self isSelected]) {
      // button was disappearing behind the selected view.  This fixes it and even looks nifty
      [self setSelected:NO animated:NO];
      [self setSelected:YES animated:NO];
    }
  }
}

- (void)checkTouchAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
  // The transform matrix
  CGAffineTransform transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
  checkButton.transform = transform;
  [UIView beginAnimations:@"checkTouch2" context:nil];
  [checkButton setAlpha:1.0];
  [self updateButtonImageWithAnimation:NO];
  transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
  checkButton.transform = transform;
  [UIView commitAnimations];
}

- (void)checkButtonPressed:(id)sender{
  // toggle checked
  BOOL wasChecked = [[[self checkListItemReview] checked] boolValue];
  
  [[self checkListItemReview] setChecked:[NSNumber numberWithBool:!wasChecked]];
  //TODO:update isChekced on item review
  [self updateButtonImageWithAnimation:YES];
  
  // call delagate if registered
  if (delegate){
    if([(id)delegate respondsToSelector:@selector(checkListItemReviewChanged:)]) {
      [delegate checkListItemReviewChanged:[self checkListItemReview]];
    }
  }
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
