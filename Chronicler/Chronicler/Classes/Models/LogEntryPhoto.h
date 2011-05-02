//
//  LogEntryPhoto.h
//  Chronicler
//
//  Created by Rusty Zarse on 5/1/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LogEntry;

@interface LogEntryPhoto : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) id photoData;
@property (nonatomic, retain) LogEntry * logEntry;

@end
