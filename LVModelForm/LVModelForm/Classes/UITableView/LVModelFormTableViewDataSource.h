//
//  LVModelFormTableViewDataSource.h
//  LVModelForm
//
//  Created by Rusty Zarse on 7/26/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVModelFormConfig.h"
#import "LVTableViewCellController.h"
/** 
 UITableViewDataSource used to connect LVModelFormConfig and 
 LVTableViewCellController to the UITableView
 **/
@interface LVModelFormTableViewDataSource : NSObject<UITableViewDataSource> {
    
}
/** LVModelFormConfig used to configure sections, rows and cells **/
@property (retain, nonatomic) LVModelFormConfig *modelFormConfig;
/** LVTableViewCellController used to mediate UITableViewCell management and data **/
@property (retain, nonatomic) LVTableViewCellController *tableViewCellController;

@end
