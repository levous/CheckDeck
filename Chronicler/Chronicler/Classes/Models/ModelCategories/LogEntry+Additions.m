//
//  LogEntry+Additions.m
//  Chronicler
//
//  Created by Rusty Zarse on 5/1/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LogEntry+Additions.h"


@implementation LogEntry (Additions)

- (NSString *)description{
    return [NSString stringWithFormat:@"%@ %@", [self title], [self createdOn]];
}
@end
