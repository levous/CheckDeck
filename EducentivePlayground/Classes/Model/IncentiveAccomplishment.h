//
//  IncentiveAccomplishment.h
//  EducentivePlayground
//
//  Created by Rusty Zarse on 2/26/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface IncentiveAccomplishment :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * pointValue;
@property (nonatomic, retain) NSManagedObject * plan;

@end



