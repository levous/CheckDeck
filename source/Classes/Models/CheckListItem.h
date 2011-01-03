//
//  CheckListItem.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/2/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckListItemGroup;

@interface CheckListItem :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) CheckListItemGroup * checkListGroup;

@end



