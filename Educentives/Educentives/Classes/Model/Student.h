//
//  Student.h
//  Educentives
//
//  Created by Rusty Zarse on 8/20/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Patron;

@interface Student : NSManagedObject {
@private
}
@property (nonatomic, retain) NSSet *studentGroups;
@property (nonatomic, retain) Patron *patrons;
@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addStudentGroupsObject:(NSManagedObject *)value;
- (void)removeStudentGroupsObject:(NSManagedObject *)value;
- (void)addStudentGroups:(NSSet *)values;
- (void)removeStudentGroups:(NSSet *)values;

@end
