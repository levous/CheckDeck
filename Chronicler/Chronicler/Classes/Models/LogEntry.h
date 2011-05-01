//
//  LogEntry.h
//  Chronicler
//
//  Created by Rusty Zarse on 4/25/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LogEntryPhoto;

@interface LogEntry : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSDate * updatedOn;
@property (nonatomic, retain) NSString * logEntryId;
@property (nonatomic, retain) LogEntryPhoto * logEntryPhotos;

@end
