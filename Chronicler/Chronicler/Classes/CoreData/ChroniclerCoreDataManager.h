//
//  CoreDataManager.h
//  Chronicler
//
//  Created by Rusty Zarse on 4/25/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVCoreDataManager.h"
#import "LogEntryPhoto.h"
#import "LogEntry.h"


@interface ChroniclerCoreDataManager : LVCoreDataManager {}
+ (ChroniclerCoreDataManager *)instance;
- (LogEntry *)insertNewLogEntry;
- (LogEntryPhoto *)addPhoto:(UIImage *)photo forLogEntry:(LogEntry *)logEntry;
@end
