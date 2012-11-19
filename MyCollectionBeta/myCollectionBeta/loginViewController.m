//
//  loginViewController.m
//  myCollectionBeta
//
//  Created by Yoann Hubert on 09/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "loginViewController.h"
#import "MICheckBox.h"
#import <Foundation/NSCoder.h>
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>


@interface loginViewController ()

@end




@class MICheckBox;

@implementation loginViewController
@synthesize textFieldDelegate=_textFieldDelegate;
@synthesize mychoices=_mychoices;
@synthesize choiceTypeButton=_choicetypeButton;
@synthesize billingAddress=_billingAddress,address=_address, company=_company,iname=_iname,ifirstName=_ifirstName,cardNumber=_cardNumber,cvv=_cvv;
@synthesize gestureDelegate=_gestureDelegate;
@synthesize Savedata=_Savedata;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.textFieldDelegate=self;
        self.gestureDelegate=self;
        
       
      
         
    }
 
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   // [self recoverData];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    // Key for the Dictionary defined in myUserdataLogin.plist
    mykeyforUserdata=[[NSArray alloc]initWithObjects:@"Company Name",@"Name",@"First Name",@"Address", @"Type_of_Payement",@"Card Number",@"CVV",@"Billing Address",nil];
    
    // Values for the pickerView and button to start the picker view.
    mychoices=[[NSArray alloc]initWithObjects:@"Visa Card",@"MasterCard",@"American Express",nil]; //self.choiceTypeButton=[[UIButton alloc]init];
    
    // Fill an Array with my textField.text for using it afterwards
    myfileArray=[[NSMutableArray alloc]initWithObjects:[self.company text],[self.iname text],[self.ifirstName text],[self.address text],[typeofP text],[self.cardNumber text],[self.cvv text],[self.billingAddress text], nil];
    
    // Path for my Property List file.
    filePathforplist = @"myUserDataLogin.plist";
    
    //Fill an Array with textField id only
    myTextFieldOnly=[[NSMutableArray alloc]initWithObjects:self.company,self.iname,self.ifirstName,self.address,self.cardNumber,self.cvv,self.billingAddress, nil];
    
    // Tap Recognizer
    //---------------
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [typeofP addGestureRecognizer:tapRecognizer];
    
    
    // Prepare typeOf Label
    //-----------------------
    CGRect frame;
    frame.origin.x=209;
    frame.origin.y=248;
    frame.size.width=220;
    frame.size.height=30;
    
    
    typeofP = [[UILabel alloc]initWithFrame:frame];
    typeofP.restorationIdentifier=@"typeOfPResto";
    typeofP.text=nil;
   
    // Official way
    //-------------
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"myUserDataLogin.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"myUserDataLogin" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    if (!temp) {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
 
    
    for(int i=0;i<mykeyforUserdata.count;i++){
        NSLog(@" %@",[temp objectForKey:[mykeyforUserdata objectAtIndex:i]]);
    }
    
    self.company.text = [temp objectForKey:@"Company Name"];
    NSLog(@" %@",self.company.text);
    self.iname.text =  [temp objectForKey:@"Name"];
    self.ifirstName.text =  [temp objectForKey:@"First Name"];
    self.address.text =  [temp objectForKey:@"Address"];
    typeofP.text =[NSString stringWithFormat:@"%@",[temp objectForKey:@"Type_of_Payement"]];
    NSLog(@" ok or not  : %@",typeofP.text);
    self.cardNumber.text=[temp objectForKey:@"Card Number"];
    self.cvv.text=[temp objectForKey:@"CVV"];
    self.billingAddress.text=[temp objectForKey:@"Billing Address"];
    
    
    /// (Everything which has linked with the bounds of the view cannot be in Viewdidload)
    // Make the checkBox Appears for the using of it.
    MICheckBox *checkBox =[[MICheckBox alloc]initWithFrame:CGRectMake(209, 360, 200, 25)];
	[checkBox setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
	[checkBox setTitle:@"Same Address" forState:UIControlStateNormal];
	[self.view addSubview:checkBox];
    [checkBox setDelegate:self];
    
    
    // If there valid value for this label, we add the lbel as subview ( which will cover the button
    NSLog(@"t%@t",typeofP.text);
    if ([typeofP.text isEqualToString:@"Visa Card"]|| [typeofP.text isEqualToString:@"Master Card"] || [typeofP.text isEqualToString:@"American Express"]) {
        [typeofP setHighlighted:YES];
        [self.view addSubview:typeofP];
        
    }
    
    
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)PickerViewAction:(id)sender {
    myPicker=[[UIPickerView alloc] initWithFrame:CGRectMake(210, 245, 320, 400)];
    myPicker.delegate=self;
    myPicker.dataSource=self;       
    myPicker.showsSelectionIndicator=YES;
   // [myPicker selectRow:4 inComponent:0 animated:YES];
    
    
    [self.view addSubview:myPicker];
    [myPicker reloadAllComponents];
 
}




- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer{

    [self PickerViewAction:typeofP];

}

-(BOOL)copyAddress{
    
    // Copy first Address in the Billing Adress Field
    [self.billingAddress setText:[self.address text]];
    
    // If done well, return one, else zero
    if([self.billingAddress.text isEqualToString:[self.address text]]){
        [self.billingAddress setTextColor:[UIColor blackColor]];
        return 1;
    }
    else{
        return 0;
    }
    
}
-(BOOL)removeCopiedAddress{
   
    // Remove text and replace the Placeholder
    [self.billingAddress setText:self.billingAddress.placeholder];
    // If done well, return one, else zero
    if([self.billingAddress.text isEqualToString:self.billingAddress.placeholder]){
        [self.billingAddress setTextColor:[UIColor grayColor]];
        return 1;
    }
    else{
        return 0;
    }
}
/*
- (NSString *)filePathforplist {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePathforplist = [documentsDirectory stringByAppendingPathComponent:@"myUserDataLogin.plist"];
    return filePathforplist;
        }

*/




#pragma Mark - Manage data
/*
-(BOOL)recoverData{
    
    
    // Official way
    //-------------
    
    NSString *path = [NSString stringWithFormat:@"%@/myUserDataLogin.plist", NSTemporaryDirectory()];
    NSString *errorString;
    NSData *xmlData;
   // id plist;
    
    xmlData = [NSData dataWithContentsOfFile:path];
    myUserDataLogin = (id)CFPropertyListCreateFromXMLData(kCFAllocatorDefault,
                                                (CFDataRef)xmlData, kCFPropertyListMutableContainers,
                                                (CFStringRef *)&errorString);
    
    if(myUserDataLogin !=nil){
        return YES;
    }
    else {
        return NO;
    }

    // Path for the File to save :
    //---------------------------
    
    rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    filePath = [[rootPath stringByAppendingPathComponent:@"userdataPAY.archive"] stringByExpandingTildeInPath];
    
    // Recover UserData if it exists :
    // --------------------------------
    
    NSLog(@"Ready to unarchive");
    load=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@" File unarchived @%",load);
    
    // If the file exists, place a UILabel instead of UITextField in file it with data.
    if(load!=nil){
        NSArray *myField=[[NSArray alloc]initWithObjects:self.company,self.iname,self.address.text,typeofP,self.cardNumber,self.cvv,self.billingAddress,nil] ;  
        for(int i=0;i<myField.count;i++){
            [[myField objectAtIndex:i]addSubview:[[UILabel alloc]init]];
            [[[[[myField objectAtIndex:i]subviews]objectAtIndex:0]textLabel]setText:[load objectAtIndex:i]];
            
            
        }
        return 1;
    }
    else{
        NSLog(@"File empty or doesn't exist");
        return 0;
    }
 
 
}

*/

-(IBAction)saveUser:(id)sender{
 /*
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@" %@",paths);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    NSLog(@"  %@",documentsPath);
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"myUserDataLogin.plist"];
    NSLog(@" %@",plistPath);
    
    
   */ 
    
    NSLog(@" %@",self.company.text);
    NSLog(@" %@",self.iname.text);
    NSLog(@" %@",self.ifirstName.text);
    NSLog(@" %@",self.address.text);
    NSLog(@" %@",typeofP.text);
    NSLog(@" %@",self.cardNumber.text);
    NSLog(@" %@",self.cvv.text);
    NSLog(@" %@",self.billingAddress.text);
    
     // create dictionary with values in UITextFields
    [myUserDataLogin setValue:  self.company.text forKey:@"Company Name"];
    [myUserDataLogin setValue : self.iname.text forKey:@"Name"];
    [myUserDataLogin setValue: self.ifirstName.text forKey:@"First Name"];
    [myUserDataLogin setValue: self.address.text forKey:@"Address"];
    [myUserDataLogin setValue: typeofP.text forKey:@"Type_of_Payement"];
    [myUserDataLogin setValue: self.cardNumber.text forKey:@"Card Number"];
    [myUserDataLogin setValue:  self.cvv.text forKey:@"CVV"];
    [myUserDataLogin setValue:  self.billingAddress.text forKey:@"Billing Address"];
    
    
    
    // Official way
    //
    
    
    NSString *error;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"myUserDataLogin.plist"];
  /*  NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:
                               [NSArray arrayWithObjects: self.company.text,self.iname.text,self.address.text,typeofP.text,self.cardNumber.text,self.cvv.text, nil]
                                                          forKeys:[NSArray arrayWithObjects: @"Company Name", @"Name",@"First Name",@"Adress",@"Type_of_Payement",@"Card Number",@"CVV",@"Billing Address", nil]]; */
    NSDictionary *plistDict=[[NSDictionary alloc]initWithDictionary: myUserDataLogin];
    

    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict
                                                                   format:NSPropertyListXMLFormat_v1_0
                                                         errorDescription:&error];
    if(plistData) {
        [plistData writeToFile:plistPath atomically:YES];
        
        // Ok it is saved, customization
        _Savedata.highlighted=YES;
        CGRect frameSave;
        frameSave.origin=_Savedata.frame.origin;
        frameSave.size=_Savedata.frame.size;
        UILabel *saved=[[UILabel alloc]initWithFrame:frameSave];
        saved.text=@"Saved !";
        saved.font=[UIFont boldSystemFontOfSize:16];
        saved.textColor=[UIColor yellowColor];
        saved.backgroundColor=[UIColor scrollViewTexturedBackgroundColor];
        [_Savedata removeFromSuperview];
        [self.view addSubview:saved];
        [self.view setNeedsDisplay];
        
    }
    else {
        NSLog(@"%@",error);
        [error release];
    }
   
}
-(IBAction)resetUserData:(id)sender{
    
// delete archive
      NSFileManager *localFileManager=[[NSFileManager alloc] init];
  //  if([localFileManager removeItemAtPath:filePath error:nil]){
  //      NSLog(@"File properly deleted");
  //  }
  //  else {
   //     NSLog(@"Problem with deleting of the file");
  //  }
    
    [self performSegueWithIdentifier:@"loginSegue" sender:self];

// Erase text in UITextField
/*    NSArray *arraysubViews = [[self.view subviews]select:];
    
    for(UIView *subView in arraysubViews){
        
        if([subView isKindOfClass:[UITextField class]]){
            // if(subView.tag == MY_TEXT_VIEW_TAG)
            subView.
        }
    }
   
    for(int i=0;i<myTextFieldOnly.count;i++){
        
        [[myTextFieldOnly objectAtIndex:i] addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        
        [[myTextFieldOnly objectAtIndex:i]setClearButtonMode:UITextFieldViewModeAlways];
        [self textFieldShouldClear:[myfileArray objectAtIndex:i]];
        [[[myTextFieldOnly objectAtIndex:i]rightView]
    
    }
    [typeofP removeFromSuperview];
   
    //[self.view setNeedsDisplay];
    
    for(int i=0;i<myfileArray.count;i++){
        [myfileArray objectAtIndex:i]=nil;
    } */
}

#pragma Mark - TextField Delegate

- (IBAction) textFieldReturn:(id)textField
{
    [textField resignFirstResponder];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    

    NSLog(@" %@", self.iname.text);
   
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    return NO;

}


#pragma Mark - Picker Management

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return mychoices.count;

}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 320;
    
    return sectionWidth;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [mychoices objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    [pickerView removeFromSuperview];
    [self.choiceTypeButton removeFromSuperview];
   
       
    [typeofP setText:[NSString stringWithFormat:@" %@",[mychoices objectAtIndex:row]]];

    [typeofP setHighlighted:YES];
    [self.view addSubview:typeofP];
   
    
 
}

#pragma Mark - Preservation


- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    
    //For custom text view
    //------------------------------------------------------------------------
    NSRange range = [[self.company selectedTextRange] range];
   // NSRange range= NSRangeFromString(self.company.text);
    [coder encodeInt:range.length forKey:@"kMyCompanyNameSelectionRangeLength"];
    [coder encodeInt:range.location forKey:@"kMyCompanyNameSelectionRangeLocation"];
    //------------------------------------------------------------------------
}

#pragma Mark - Restoration

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    
    //For custom text view
    //------------------------------------------------------------------------
    if ([coder containsValueForKey:@"kMyCompanyNameSelectionRangeLength"] &&
        [coder containsValueForKey:@"kMyCompanyNameSelectionRangeLocation"]) {
        NSRange range;
        range.length = [coder decodeIntForKey:@"kMyCompanyNameSelectionRangeLength"];
        range.location = [coder decodeIntForKey:@"kMyCompanyNameSelectionRangeLocation"];
        if (range.length > 0){
            //[self.company setSelectionRange:range];
         //   [self.company setSelectedTextRange:[self frameOfTextRange:range inTextView:[self.company textInputView]]];
    }
    //---------------------------------------------------------------------------
     
}
}

- (CGRect)frameOfTextRange:(NSRange)range inTextView:(UITextView *)textView
{
    UITextPosition *beginning = textView.beginningOfDocument;
    UITextPosition *start = [textView positionFromPosition:beginning offset:range.location];
    UITextPosition *end = [textView positionFromPosition:start offset:range.length];
    UITextRange *textRange = [textView textRangeFromPosition:start toPosition:end];
    CGRect rect = [textView firstRectForRange:textRange];
    return [textView convertRect:rect fromView:textView.textInputView];
}
@end
