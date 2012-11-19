//
//  ImagePickerController.m
//  TeamApp1
//
//  Created by Yoann Hubert on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImagePickerController.h"
#import "ModalViewController.h"



@implementation ImagePickerController
@synthesize imagePicker=_imagePicker;
@synthesize photoView=_photoView;
//@synthesize imagePicker;
@synthesize delegate;
//@synthesize alert;
@synthesize cameraDevice=_cameraDevice;
@synthesize showsCameraControls=_showsCameraControls;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}


- (void)imagePickerControllerDidCancel {
    
    [[_imagePicker parentViewController] dismissModalViewControllerAnimated:YES];
    
   // [_imagePicker release];
    
}
- (void)imagePickerController: 

didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    _photoView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [[_imagePicker parentViewController] dismissModalViewControllerAnimated:YES];
    
   // [_imagePicker release];
    
}


@end
