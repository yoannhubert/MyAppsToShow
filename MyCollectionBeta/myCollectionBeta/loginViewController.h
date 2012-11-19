//
//  loginViewController.h
//  myCollectionBeta
//
//  Created by Yoann Hubert on 09/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MICheckBox.h"
#import "MasterViewController.h"

@class MICheckBox;

@protocol forCheckBox <NSObject>
@required
-(BOOL)copyAddress;
-(BOOL)removeCopiedAddress;

@end

@class MasterViewController;



@interface loginViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate,UIGestureRecognizerDelegate,forCheckBox>{

    UIPickerView *myPicker;
    NSArray *mychoices;
   // NSString *rootPath;
    //NSString *filePath;
    NSMutableArray *load;
    NSMutableArray *myfileArray;
    NSMutableArray *myTextFieldOnly;
    NSArray *mykeyforUserdata;
    IBOutlet UIButton *choiceTypeButton;
    IBOutlet UITextField *billingAddress;
    IBOutlet UITextField *address;
    IBOutlet UITextField *company;
    IBOutlet UITextField *iname;
    IBOutlet UITextField *ifirstName;
    UILabel *typeofP;
    UIView *subviewForTypeOf;
    
     IBOutlet UITextField *cardNumber;
     IBOutlet UITextField *cvv;
    
    NSDictionary *myUserDataLogin;
   NSString *filePathforplist;
    UITapGestureRecognizer *tapRecognizer;
    IBOutlet UIButton *Savedata;
    

   
    

}

@property(nonatomic,strong) NSArray *mychoices;
@property (nonatomic,strong) IBOutlet UIButton *choiceTypeButton;
@property (nonatomic,strong) IBOutlet UITextField *billingAddress;
@property (nonatomic,strong) IBOutlet UITextField *address;
@property (nonatomic,strong) IBOutlet UITextField *company;
@property (nonatomic,strong) IBOutlet UITextField *iname;
@property (nonatomic,strong) IBOutlet UITextField *ifirstName;
@property(nonatomic,strong) IBOutlet UIButton *Savedata;
//@property (nonatomic,strong) IBOutlet UITextField *typeofP;
@property (nonatomic,strong) IBOutlet UITextField *cardNumber;
@property (nonatomic,strong) IBOutlet UITextField *cvv;
@property (nonatomic,assign) id<UITextFieldDelegate> textFieldDelegate;
@property(nonatomic,assign)id<UIGestureRecognizerDelegate> gestureDelegate;
//@property (nonatomic,retain) UIPickerView *myPicker;


-(IBAction)PickerViewAction:(id)sender;
-(IBAction)saveUser:(id)sender;
-(BOOL)recoverData;
-(IBAction)textFieldDidChange:(UITextField *)textField;
- (NSString *)filePathforplist;
- (CGRect)frameOfTextRange:(NSRange)range inTextView:(UITextView *)textView;

@end
