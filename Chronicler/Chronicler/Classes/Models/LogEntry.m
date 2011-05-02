//
//  LogEntry.m
//  Chronicler
//
//  Created by Rusty Zarse on 5/1/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import "LogEntry.h"
#import "LogEntryPhoto.h"


@implementation LogEntry
@dynamic createdOn;
@dynamic title;
@dynamic logEntryId;
@dynamic note;
@dynamic updatedOn;
@dynamic logEntryPhotos;

- (void)addLogEntryPhotosObject:(LogEntryPhoto *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"logEntryPhotos" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"logEntryPhotos"] addObject:value];
    [self didChangeValueForKey:@"logEntryPhotos" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeLogEntryPhotosObject:(LogEntryPhoto *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"logEntryPhotos" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"logEntryPhotos"] removeObject:value];
    [self didChangeValueForKey:@"logEntryPhotos" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addLogEntryPhotos:(NSSet *)value {    
    [self willChangeValueForKey:@"logEntryPhotos" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"logEntryPhotos"] unionSet:value];
    [self didChangeValueForKey:@"logEntryPhotos" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeLogEntryPhotos:(NSSet *)value {
    [self willChangeValueForKey:@"logEntryPhotos" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"logEntryPhotos"] minusSet:value];
    [self didChangeValueForKey:@"logEntryPhotos" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
