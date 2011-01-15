//
//  CheckListReview.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/7/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckList;
@class CheckListItemReview;

@interface CheckListReview :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) CheckList * checkList;
@property (nonatomic, retain) NSSet* checkListItemReviews;

@end


@interface CheckListReview (CoreDataGeneratedAccessors)
- (void)addCheckListItemReviewsObject:(CheckListItemReview *)value;
- (void)removeCheckListItemReviewsObject:(CheckListItemReview *)value;
- (void)addCheckListItemReviews:(NSSet *)value;
- (void)removeCheckListItemReviews:(NSSet *)value;

@end

