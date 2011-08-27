//
//  Student.h
//  Educentives
//
//  Created by Rusty Zarse on 8/23/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Patron, StudentGroup;

@interface Student : NSManagedObject {
@private
}
@property (nonatomic, retain) Patron *patrons;
@property (nonatomic, retain) NSSet *studentGroups;
@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addStudentGroupsObject:(StudentGroup *)value;
- (void)removeStudentGroupsObject:(StudentGroup *)value;
- (void)addStudentGroups:(NSSet *)values;
- (void)removeStudentGroups:(NSSet *)values;

@end
