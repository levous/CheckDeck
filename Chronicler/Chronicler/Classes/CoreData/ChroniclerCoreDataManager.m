//
//  CoreDataManager.m
//  Chronicler
//
//  Created by Rusty Zarse on 4/25/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "ChroniclerCoreDataManager.h"
#import "NSString+LVAdditions.h"

@implementation ChroniclerCoreDataManager

static ChroniclerCoreDataManager *_sharedInstance;
+ (ChroniclerCoreDataManager *)instance{
    if (_sharedInstance == nil) {
        _sharedInstance = [[ChroniclerCoreDataManager alloc] init];
    }
    return _sharedInstance;
}


- (LogEntry *)insertNewLogEntry{
	LogEntry *item = (LogEntry *)[NSEntityDescription insertNewObjectForEntityForName:@"LogEntry" inManagedObjectContext:[self managedObjectContext]];
    [item setCreatedOn:[NSDate date]];
    [item setLogEntryId:[NSString lvStringWithGeneratedUUID]];
    return item;
}

- (LogEntryPhoto *)addPhoto:(UIImage *)photo forLogEntry:(LogEntry *)logEntry{
    LogEntryPhoto *item = (LogEntryPhoto *)[NSEntityDescription insertNewObjectForEntityForName:@"LogEntryPhoto" inManagedObjectContext:[self managedObjectContext]];
    [item setPhotoData:photo];
    [logEntry addLogEntryPhotosObject:item];
    return item;
}

@end
