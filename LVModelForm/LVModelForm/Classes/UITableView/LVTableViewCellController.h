//
//  LVTableViewCellController.h
//  LVModelForm
//
//  Created by Rusty Zarse on 7/26/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVModelFormConfig.h"
/**
 Responsible for mediation between the LVModelFormConfig and the 
 UITableViewControllerDataSource and UITableViewControllerDelegate.
 */
@interface LVTableViewCellController : NSObject {
    
}
/** LVModelFormConfig used to create and configure UITableViewCells */
@property (retain, nonatomic) LVModelFormConfig *modelFormConfig;

/** 
 Creates or dequeues a UITableViewCell as configured by the targeted 
 LVModelFormConfigRow at the indexPath.  Does not apply data binding to the cell.  */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
