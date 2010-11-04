//
//  CheckListItem.h
//  CheckDeck
//
//  Created by Rusty Zarse on 10/27/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "SimpleModel.h"

@interface CheckListItem :  SimpleModel  
{
}

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSManagedObject * checkListGroup;

@end



