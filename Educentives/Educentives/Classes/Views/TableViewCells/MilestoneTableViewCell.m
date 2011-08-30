//
//  MilestoneTableViewCell.m
//  Educentives
//
//  Created by Rusty Zarse on 8/27/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "MilestoneTableViewCell.h"

@implementation MilestoneTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithEntity:(NSManagedObject *)aMilestone{
    [[self textLabel] setText:[aMilestone title]];
    //TODO:make this beautiful image
    [[self imageView] setImage:[UIImage imageNamed:@"workComplete-icon.png"]]; 
}

@end
