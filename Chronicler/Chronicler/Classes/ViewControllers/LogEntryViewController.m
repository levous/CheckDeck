//
//  LogEntryViewController.m
//  Chronicler
//
//  Created by Rusty Zarse on 4/19/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "LogEntryViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "WordProcessingMLDocument.h"
#import <QuartzCore/QuartzCore.h>
#define kImageItemMargin 15.0

@interface LogEntryViewController (Private)
- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) delegate;
- (void)addPhoto:(UIImage *)image;
- (void)configureLogEntryUI;
@end

@implementation LogEntryViewController
@synthesize noteLabel;
@synthesize logImageAddButton;
@synthesize titleText, scrollView;
@synthesize logImage;
@synthesize noteTextView;
@synthesize logEntry, coreDataManager;


#pragma -
#pragma init and dealloc


- (void)dealloc
{
    [titleText release];
    [logImage release];
    [noteTextView release];
    [logEntry release];
    [noteLabel release];
    [logImageAddButton release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

#pragma mark -
#pragma mark CoreData Interaction

- (BOOL)save{
    [[self logEntry] setTitle:[[self titleText] text]];
    [[self logEntry] setNote:[[self noteTextView] text]];
    [[self logEntry] setUpdatedOn:[NSDate date]];
    return [[self coreDataManager] commitPendingChanges:nil];
}

- (void)addPhoto:(UIImage *)image{
    [[self coreDataManager] addPhoto:image forLogEntry:[self logEntry]];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self scrollView] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"quilted-paper.png"]]];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonPressed:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
    
    // initialize core data manager
    [self setCoreDataManager:[ChroniclerCoreDataManager instance]];
    
    // wire text field delegation
    [[self titleText] setDelegate:self];
    [[self noteTextView] setDelegate:self];
    
    // set content view larger than frame
    CGSize tallerThanFrame = CGSizeMake([[self view] frame].size.width, 800);
    [[self scrollView] setContentSize:tallerThanFrame];
    
    // insert a new log entry if none provided
    if( [self logEntry] == nil ){
        [self setLogEntry:[[self coreDataManager] insertNewLogEntry]];
    }
    
    // configure log entry UI
    [self configureLogEntryUI];
    
    
}

- (void)viewDidUnload
{
    /*[self setTitleText:nil];
     [self setLogImage:nil];
     [self setNoteTextView:nil];*/
    
    [self setNoteLabel:nil];
    [self setLogImageAddButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma mark UI Actions

- (void)configureLogEntryUI{
    if ([self logEntry]) {
        [[self titleText] setText:[[self logEntry] title]];
        [[self noteTextView] setText:[[self logEntry] note]];
        //TODO: need to support multiple
        if( [[[self logEntry] logEntryPhotos] count] > 0 ){
            CGRect contentFrame = [[self view] frame];
            CGRect logImageFrame = [[self logImage] frame];
         
            int maxLeft = contentFrame.size.width - ( logImageFrame.size.width + logImageFrame.origin.x );
            int nextImageLeft = logImageFrame.origin.x;
            int nextImageTop = logImageFrame.origin.y;
            // get view to add new image views to
            UIView *imageContainerView = [[self logImage] superview];
            // remove placeholder image from super view
            [[self logImage] removeFromSuperview];
            for (LogEntryPhoto *logEntryPhoto in [[self logEntry] logEntryPhotos]) {
                // get the image 
                UIImage *image = [logEntryPhoto photoData];
        
                // place next image to the right of previous
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(nextImageLeft, nextImageTop, logImageFrame.size.width, logImageFrame.size.height)];
                // configure new image view
                [imageView setContentMode:[[self logImage] contentMode]];
                [imageView setImage:image];
                [imageView setBackgroundColor:[UIColor whiteColor]];
                // pretty rounded border
                [[imageView layer] setCornerRadius:8.0];
                [[imageView layer] setMasksToBounds:YES];
                [[imageView layer] setBorderColor:[[UIColor darkGrayColor] CGColor]];
                [[imageView layer] setBorderWidth:0.5];
                
                // add to same super view
                [imageContainerView addSubview:imageView];
                // done 
                [imageView release];
                
                // set left for next image
                nextImageLeft += ( logImageFrame.size.width + kImageItemMargin );
                // next row if end of line
                if( nextImageLeft > maxLeft ){
                    nextImageTop += logImageFrame.size.height + kImageItemMargin;
                    nextImageLeft = logImageFrame.origin.x;
                }
            }
            
            // move the add button
            [[self logImageAddButton] setFrame:CGRectMake(nextImageLeft, nextImageTop, logImageFrame.size.width, logImageFrame.size.height)];
            
            // move the note and its label down, if necessary
            CGRect noteLabelFrame = [[self noteLabel] frame];
            [[self noteLabel] setFrame:CGRectMake(noteLabelFrame.origin.x, nextImageTop + logImageFrame.size.height + kImageItemMargin, noteLabelFrame.size.width, noteLabelFrame.size.height)];
            
            CGRect noteFrame = [[self noteTextView] frame];
            [[self noteTextView] setFrame:CGRectMake(noteFrame.origin.x, nextImageTop + logImageFrame.size.height + kImageItemMargin + noteLabelFrame.size.height, noteFrame.size.width, noteFrame.size.height)];
            
        }
    }
    

}

- (IBAction)captureImageTouched{
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

-(IBAction)saveButtonPressed:(id)sender {
	if ([self save])
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved..." message:@"Saved Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];
	}
}

#pragma -
#pragma UIImagePickerControllerDelegate
// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    [picker release];
}

// For responding to the user accepting a newly-captured picture or movie
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo) {
        
        editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
        // Save the new image (original or edited) to the Camera Roll
        //UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
        
        [self addPhoto:imageToSave];
        
        WordProcessingMLDocument *doc = [[[WordProcessingMLDocument alloc] init] autorelease];
        NSLog([doc getXml], nil);
    }
    
    // Handle a movie capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
        
        NSString *moviePath = [[info objectForKey:
                                UIImagePickerControllerMediaURL] path];
        
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (moviePath)) {
            UISaveVideoAtPathToSavedPhotosAlbum (moviePath, nil, nil, nil);
        }
    }
    
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    [picker release];
}
#pragma UINavigationControllerDelegate
// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;

#pragma -
#pragma Image Capture

- (BOOL) startCameraControllerFromViewController:(UIViewController*) controller
                                   usingDelegate:(id <UIImagePickerControllerDelegate, UINavigationControllerDelegate>) delegate {
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    
    
    if (([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO)
        || (delegate == nil)
        || (controller == nil)){
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO){
            return NO;
        }
        
        cameraUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // Displays a control that allows the user to choose picture or
        // movie capture, if both are available:
        cameraUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];

    }else{
        cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
        // Displays a control that allows the user to choose picture or
        // movie capture, if both are available:
        cameraUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];

    }
    
    
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = YES;
    
    cameraUI.delegate = delegate;
    
    [controller presentModalViewController:cameraUI animated: YES];
    return YES;
}

#pragma Memory Notifications

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark UITextField Delegation

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark Auto Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
