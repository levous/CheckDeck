//
//  CheckListItem.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/7/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckListItemGroup;
@class CheckListItemReview;

@interface CheckListItem :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSSet* checkListItemReviews;
@property (nonatomic, retain) CheckListItemGroup * checkListGroup;

@end


@interface CheckListItem (CoreDataGeneratedAccessors)
- (void)addCheckListItemReviewsObject:(CheckListItemReview *)value;
- (void)removeCheckListItemReviewsObject:(CheckListItemReview *)value;
- (void)addCheckListItemReviews:(NSSet *)value;
- (void)removeCheckListItemReviews:(NSSet *)value;

@end

