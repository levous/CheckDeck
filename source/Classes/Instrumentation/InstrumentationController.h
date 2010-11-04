//
//  InstrumentationController.h
//  IMBills
//
//  Created by Rusty Zarse on 8/18/10.
//  Copyright 2010 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface InstrumentationController : NSObject {

}
+ (void)logWithFormat:(NSString *)formatString, ...;
+ (void)logInfo:(NSString *)message;
@end
