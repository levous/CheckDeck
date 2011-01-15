//
//  CheckListItemReviewTableViewCell.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CheckListItemReviewTableViewCellDelegate

@optional
- (void)checkListItemReviewChanged:(CheckListItemReview *)checkListItemReview;
@end

@interface CheckListItemReviewTableViewCell : UITableViewCell {
  CheckListItemReview *checkListItemReview;
}
@property (retain, nonatomic) id<CheckListItemReviewTableViewCellDelegate> delegate;
@property (assign, nonatomic) CheckListItemReview *checkListItemReview;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UIButton *checkButton;
- (void)checkButtonPressed:(id)sender;
- (void)updateButtonImageWithAnimation:(BOOL)shouldAnimate;
+ (NSString *)reuseIdentifier;
@end
