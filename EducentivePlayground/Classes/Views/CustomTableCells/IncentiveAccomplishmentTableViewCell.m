//
//  IncentiveAccomplishmentTableViewCell.m
//  EducentivePlayground
//
//  Created by Rusty Zarse on 3/29/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "IncentiveAccomplishmentTableViewCell.h"


@implementation IncentiveAccomplishmentTableViewCell

#pragma mark -
#pragma mark init

@synthesize pointValueLabel, titleLabel;

- (NSString *)reuseIdentifier{
	NSString *reuseID = [super reuseIdentifier];
	return reuseID;
}

#pragma mark -
#pragma mark dealloc

- (void)dealloc {
    [super dealloc];
}


#pragma mark -
#pragma mark init

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}

- (void)configureCellWithEntity:(IncentiveAccomplishment *)incentiveAccomplishment{
	[[self pointValueLabel] setText:[NSString stringWithFormat:@"%@", [incentiveAccomplishment pointValue]]];
	[[self titleLabel] setText:[incentiveAccomplishment title]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}






@end
