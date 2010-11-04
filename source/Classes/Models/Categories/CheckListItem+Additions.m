//
//  CheckListItems+Additions.m
//  CheckDeck
//
//  Created by Rusty Zarse on 10/27/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import "CheckListItem+Additions.h"


@implementation CheckListItem (Additions)

#pragma mark -
#pragma mark NSManagedObject Lifecycle Events

- (void)awakeFromInsert
{
  [super awakeFromInsert];
  [self setCreatedAt:[NSDate date]];
}

- (void)awakeFromFetch
{
  [super awakeFromFetch];
 
}


- (void)willSave{
  [super willSave];
}

@end
