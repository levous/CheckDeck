//
//  StudentGroup.h
//  Educentives
//
//  Created by Rusty Zarse on 8/23/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AchievementPlan, Student, Teacher;

@interface StudentGroup : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) AchievementPlan *plans;
@property (nonatomic, retain) NSSet *students;
@property (nonatomic, retain) Teacher *teacher;
@end

@interface StudentGroup (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(Student *)value;
- (void)removeStudentsObject:(Student *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
