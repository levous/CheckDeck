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

    UILabel *noteLabel;
    UIButton *logImageAddButton;
}

@property (nonatomic, retain) IBOutlet UITextField *titleText;
@property (nonatomic, retain) IBOutlet UIImageView *logImage;
@property (nonatomic, retain) IBOutlet UITextView *noteTextView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UILabel *noteLabel;
@property (nonatomic, retain) IBOutlet UIButton *logImageAddButton;
@property (nonatomic, retain) ChroniclerCoreDataManager *coreDataManager;
@property (nonatomic, retain) LogEntry *logEntry;


- (IBAction)captureImageTouched;
@end
