//
//  ModalViewController.h
//  TeamApp1
//
//  Created by Yoann Hubert on 17/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class RootViewController;
@class DetailViewController;

@interface ModalViewController : UIViewController <UITextFieldDelegate>{


IBOutlet UIView * newplayer;
IBOutlet UITextField *nameplayer;
IBOutlet UITextField *levelplayer;
IBOutlet UITextField *goalplayer; 
IBOutlet UITextField *timesaweekplayer;
IBOutlet UITextField *postcodeplayer;
IBOutlet UITextField *objofmonth;
IBOutlet UIImagePickerController *imagePicker;
IBOutlet UIImageView *photoView;
IBOutlet UIAlertView *alert;
IBOutlet UIButton *deleteplayer;
IBOutlet UILabel *cadreLabel;     

    
    
}

@property (nonatomic, retain) UIView *newplayer;
@property (nonatomic, retain) UITextField *nameplayer;
@property (nonatomic, retain) UITextField *levelplayer;
@property (nonatomic, retain) UITextField *goalplayer;
@property (nonatomic, retain) UITextField *timesaweekplayer;
@property (nonatomic, retain) UITextField *postcodeplayer;
@property (nonatomic, retain) UITextField *objofmonth;
@property (nonatomic, retain) UIImageView *photoView ;
@property (nonatomic, retain) UIAlertView *alert ;
@property (nonatomic, retain) UIButton *deleteplayer;

@property (nonatomic,retain)  UILabel *cadrelabel;
@property (nonatomic, retain) UIImagePickerController *imagePicker;
@property (nonatomic, assign) id<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate> delegate;
@property (nonatomic) UIImagePickerControllerCameraDevice cameraDevice;
@property (nonatomic) BOOL showsCameraControls;


@property (nonatomic, assign) IBOutlet RootViewController *rootViewController;

- (IBAction)addPhoto:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range 
replacementString:(NSString *)string;

@end
