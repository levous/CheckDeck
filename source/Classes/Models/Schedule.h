//
//  Schedule.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/2/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CheckList;
@class CheckListItemGroup;

@interface Schedule :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet* checkListItemGroups;
@property (nonatomic, retain) NSSet* checkLists;

@end


@interface Schedule (CoreDataGeneratedAccessors)
- (void)addCheckListItemGroupsObject:(CheckListItemGroup *)value;
- (void)removeCheckListItemGroupsObject:(CheckListItemGroup *)value;
- (void)addCheckListItemGroups:(NSSet *)value;
- (void)removeCheckListItemGroups:(NSSet *)value;

- (void)addCheckListsObject:(CheckList *)value;
- (void)removeCheckListsObject:(CheckList *)value;
- (void)addCheckLists:(NSSet *)value;
- (void)removeCheckLists:(NSSet *)value;

@end

