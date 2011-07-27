//
//  LVTableViewCellController.m
//  LVModelForm
//
//  Created by Rusty Zarse on 7/26/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LVTableViewCellController.h"

@implementation LVTableViewCellController

#pragma mark - Properties

@synthesize modelFormConfig;

#pragma mark - UITableViewCell queuing and creation

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // get the config row for the index path
    LVModelFormConfigRow *row = [[self modelFormConfig] configRowForIndexPath:indexPath];
    // retrieve the configured cell class
    Class cellClass = [row tableCellClass];
    // ensure a class
    if (cellClass) {
        // generate a reuse identifier
        NSString *reuseIdentifier = [NSString stringWithFormat:@"LV-%@", NSStringFromClass(cellClass)];
        // attempt reuse
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if(!cell){
            // alloc and init that bad boy
            cell = [[cellClass alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:reuseIdentifier];
        }
        // return it
        return cell;
    }
    return nil;
}
@end
