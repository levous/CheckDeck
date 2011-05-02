//
//  LogEntryViewController.h
//  Chronicler
//
//  Created by Rusty Zarse on 4/19/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChroniclerCoreDataManager.h"

@interface LogEntryViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate> {

}

@property (nonatomic, retain) IBOutlet UITextField *titleText;
@property (nonatomic, retain) IBOutlet UIImageView *logImage;
@property (nonatomic, retain) IBOutlet UITextView *noteTextView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) ChroniclerCoreDataManager *coreDataManager;
@property (nonatomic, retain) LogEntry *logEntry;
@property (nonatomic, retain) UIImage *newImage;


- (IBAction)captureImageTouched;
@end
