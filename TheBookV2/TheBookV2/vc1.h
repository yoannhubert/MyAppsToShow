//
//  vc1.h
//  TheBookV2
//
//  Created by Yoann Hubert on 04/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePickerController.h"
#import "ViewController.h"

@class ViewController;

@interface vc1 : UIViewController {

    IBOutlet UIImagePickerController *imagePicker;
    IBOutlet UIImageView *photoView;
    IBOutlet UIAlertView *alert;
    

}

@property (nonatomic,strong) IBOutlet UIImagePickerController *imagePicker;
@property (nonatomic,strong) IBOutlet UIImageView *photoView;
@property (nonatomic,retain) IBOutlet UIAlertView *alert;
@property (nonatomic, assign) id<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate> delegate;

- (IBAction)addPhoto:(id)sender;

@end
