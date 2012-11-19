//
//  vc1.m
//  TheBookV2
//
//  Created by Yoann Hubert on 04/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc1.h"
#import "ImagePickerController.h"


@interface vc1 ()

//- (IBAction)addPhoto:(id)sender;

@end

@implementation vc1
@synthesize photoView=_photoView;
@synthesize imagePicker=_imagePicker;
@synthesize alert=_alert;
@synthesize delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   // if (self) {
      //  self=[self.storyboard instantiateViewControllerWithIdentifier:@"vc1"];
        
   // }
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
    
    [[self parentViewController]  presentModalViewController: imagePicker animated:YES];
    
    
} 

#pragma Mark -Segues 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{


}
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    
    
}



@end
