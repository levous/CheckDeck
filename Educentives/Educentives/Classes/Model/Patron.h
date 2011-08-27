//
//  Patron.h
//  Educentives
//
//  Created by Rusty Zarse on 8/23/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface Patron : NSManagedObject {
@private
}
@property (nonatomic, retain) NSSet *students;
@end

@interface Patron (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(Student *)value;
- (void)removeStudentsObject:(Student *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
