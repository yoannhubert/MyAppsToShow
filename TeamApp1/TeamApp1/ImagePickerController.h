//
//  ImagePickerController.h
//  TeamApp1
//
//  Created by Yoann Hubert on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>







@interface ImagePickerController : UIImagePickerController {

    
    //IBOutlet UIImagePickerController *imagePicker;

}
@property (nonatomic, retain) UIImageView *photoView ;
//@property (nonatomic, retain) UIAlertView *alert ;
@property (nonatomic, retain) UIImagePickerController *imagePicker;
@property (nonatomic, assign) id<UINavigationControllerDelegate, UIImagePickerControllerDelegate> delegate;
@property (nonatomic) UIImagePickerControllerCameraDevice cameraDevice;
@property (nonatomic) BOOL showsCameraControls;

@end
