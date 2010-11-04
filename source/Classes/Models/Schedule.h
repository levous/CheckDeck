//
//  Schedule.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/27/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Schedule :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet* checkListItemGroups;
@property (nonatomic, retain) NSSet* checkLists;

@end


@interface Schedule (CoreDataGeneratedAccessors)
- (void)addCheckListItemGroupsObject:(NSManagedObject *)value;
- (void)removeCheckListItemGroupsObject:(NSManagedObject *)value;
- (void)addCheckListItemGroups:(NSSet *)value;
- (void)removeCheckListItemGroups:(NSSet *)value;

- (void)addCheckListsObject:(NSManagedObject *)value;
- (void)removeCheckListsObject:(NSManagedObject *)value;
- (void)addCheckLists:(NSSet *)value;
- (void)removeCheckLists:(NSSet *)value;

@end

