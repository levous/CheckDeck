//
//  CheckListItemReview.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/7/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckListItem;
@class CheckListReview;

@interface CheckListItemReview :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * checked;
@property (nonatomic, retain) NSDate * updatedOn;
@property (nonatomic, retain) CheckListReview * checkListReview;
@property (nonatomic, retain) CheckListItem * checkListItem;

@end



