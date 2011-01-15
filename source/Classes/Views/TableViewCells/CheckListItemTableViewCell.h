//
//  CheckListItemTableViewCell.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/23/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckListItemTableViewCell : SCControlCell {
  
}
@property (retain, nonatomic) CheckListItem *checkListItem;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UIButton *checkButton;
- (void)checkButtonPressed:(id)sender;
+ (NSString *)reuseIdentifier;
@end
