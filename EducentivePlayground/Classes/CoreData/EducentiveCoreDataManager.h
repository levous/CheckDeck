//
//  EducentiveCoreDataManager.h
//  EducentivePlayground
//
//  Created by Rusty Zarse on 3/1/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "ModelImports.h"

@interface EducentiveCoreDataManager : LVCoreDataManager {

}
+ (EducentiveCoreDataManager *)instance;

/*************************************************************/
/** Fetch the plan that is currently active
 *************************************************************/
- (IncentivePlan *)getActivePlan;

@end
