//
//  vc2.m
//  TheBookV2
//
//  Created by Yoann Hubert on 06/09/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc2.h"
#import "ImagePickerController.h"

@interface vc2 ()

@end

@implementation vc2
@synthesize photoView=_photoView;
@synthesize imagePicker=_imagePicker;
@synthesize alert=_alert;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
- (IBAction)addPhoto:(id)sender{
    
    imagePicker.delegate = self.delegate;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        [alert initWithTitle:@"Camera Info" message:@"Camera  is available" delegate:self.alert cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        [alert show];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    } else
        
    {
        /*  [alert setTitle:@"Camera Info"];
         [alert setMessage:@"No camera available"];
         [alert setDelegate:self];
         [alert setCancelButtonIndex:1];
         */   
        [alert initWithTitle:@"Camera Info" message:@"No camera available" delegate:self.alert cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        [alert show];
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    
    [self presentModalViewController: imagePicker animated:YES];
    
    
} 
@end
