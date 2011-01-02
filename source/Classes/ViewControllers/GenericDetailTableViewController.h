//
//  GenericDetailTableViewController.h
//  CheckDeck
//
//  Created by Rusty Zarse on 1/1/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GenericDetailTableViewController : UITableViewController {
  SCTableViewModel *tableModel;
  NSManagedObjectContext *_managedObjectContext;
}

@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext; 

@end
