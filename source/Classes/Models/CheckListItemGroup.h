//
//  CheckListItemGroup.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/27/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckList;
@class CheckListItem;
@class Schedule;

@interface CheckListItemGroup :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet* items;
@property (nonatomic, retain) CheckList * checklist;
@property (nonatomic, retain) Schedule * schedule;

@end


@interface CheckListItemGroup (CoreDataGeneratedAccessors)
- (void)addItemsObject:(CheckListItem *)value;
- (void)removeItemsObject:(CheckListItem *)value;
- (void)addItems:(NSSet *)value;
- (void)removeItems:(NSSet *)value;

@end

