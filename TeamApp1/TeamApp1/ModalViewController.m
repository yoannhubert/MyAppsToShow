//
//  ModalViewController.m
//  TeamApp1
//
//  Created by Yoann Hubert on 17/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ModalViewController.h"
#import "DetailViewController.h"

#import "RootViewController.h"
#import "ImagePickerController.h"

#define CHARACTERS          @"0123456789ABCabc+"

@implementation ModalViewController 

@synthesize rootViewController;
@synthesize newplayer;
@synthesize nameplayer;
@synthesize levelplayer;
@synthesize goalplayer;
@synthesize timesaweekplayer;
@synthesize postcodeplayer;
@synthesize photoView;
@synthesize imagePicker;
@synthesize delegate;
@synthesize alert;
@synthesize cameraDevice;
@synthesize showsCameraControls;
@synthesize deleteplayer;
@synthesize cadrelabel;
@synthesize objofmonth;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.levelplayer setDelegate:self];
        [self.goalplayer setDelegate:self];
        [self.timesaweekplayer setDelegate:self];
        //[self.postcodeplayer setDelegate:self];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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
    
    [self.rootViewController presentViewController:imagePicker animated:YES completion:^{
        //Empty block
    }];
    
    
} 




#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{"
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    newplayer.backgroundColor = [UIColor whiteColor];   
  
    
}

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

- ( BOOL )textField:( UITextField * )textField
shouldChangeCharactersInRange:( NSRange )range
  replacementString:( NSString * )string
{
    /*
     * We only want uppercase letters and numbers in this text field, so if
     * this method is adding something else, we don't want it. But we also
     * want to support copy-and-paste, so it's not always going to be one
     * character added.
     */
    BOOL shouldAllowChange = YES;
        
        NSMutableString *newReplacement =
        [[ NSMutableString alloc ] initWithString:[ string uppercaseString ]];
    if ( ! [ string isEqualToString:newReplacement ]) {
        shouldAllowChange = NO;
    }
  
        
        NSCharacterSet *desiredCharacters = [ NSCharacterSet characterSetWithCharactersInString:CHARACTERS ];
    for ( NSUInteger i = 0; i < [ newReplacement length ]; i++ ) {
        unichar currentCharacter = [ newReplacement characterAtIndex:i ];
        if ( ! [ desiredCharacters characterIsMember:currentCharacter ]) {
            shouldAllowChange = NO;
            [ newReplacement deleteCharactersInRange:NSMakeRange( i, 1 )];
            i--;
        }
    }
        
        if ( shouldAllowChange ) {
            [ newReplacement release ];
            return YES;
        } else {
            [ textField setText:[[ textField text ]
                                 stringByReplacingCharactersInRange:range
                                 withString:newReplacement ]];
            [ newReplacement release ];
            return NO;
        }
}



- (void)dealloc
{
    [newplayer release];
    [nameplayer release];
    [levelplayer release];
    [goalplayer release];
    [timesaweekplayer release];
    [postcodeplayer release];
    [objofmonth release];
    [photoView release];
    [imagePicker release];
    [delegate release];
    [alert release];  
    [deleteplayer release];
    [cadrelabel release];
    [super dealloc];
}
@end


/* Another Method 
 
 // You can add/tailor the acceptable values here...
 #define CHARACTERS          @" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
 #define CHARACTERS_NUMBERS  [CHARACTERS stringByAppendingString:@"1234567890"]
 
 /---------------------------------------------------
 * Called whenever user enters/deletes character
 *--------------------------------------------------/
- (BOOL)textField:(UITextField *)textField 
shouldChangeCharactersInRange:(NSRange)range 
replacementString:(NSString *)string
{
    // These are the characters that are ~not~ acceptable
    NSCharacterSet *unacceptedInput =
    [[NSCharacterSet characterSetWithCharactersInString:CHARACTERS] invertedSet];
    
    // Create array of strings from incoming string using the unacceptable
    // characters as the trigger of where to split the string.
    // If array has more than one entry, there was at least one unacceptable character
    if ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] > 1)
        return NO;
    else 
        return YES;
}
 
*/

/* The perfect method to allow only alphanumeric Character set is the following  (I have just changed the Character set for my app)
//------------------------------------------------------------------------------
 
 - ( BOOL )textField:( UITextField * )textField
 shouldChangeCharactersInRange:( NSRange )range
 replacementString:( NSString * )string
 {
 
 * We only want uppercase letters and numbers in this text field, so if
 * this method is adding something else, we don't want it. But we also
 * want to support copy-and-paste, so it's not always going to be one
 * character added.
 
BOOL shouldAllowChange = YES;

NSMutableString *newReplacement =
[[ NSMutableString alloc ] initWithString:[ string uppercaseString ]];
if ( ! [ string isEqualToString:newReplacement ]) {
    shouldAllowChange = NO;
}


NSCharacterSet *desiredCharacters = [ NSCharacterSet alphanumericCharacterSet ];
for ( NSUInteger i = 0; i < [ newReplacement length ]; i++ ) {
    unichar currentCharacter = [ newReplacement characterAtIndex:i ];
    if ( ! [ desiredCharacters characterIsMember:currentCharacter ]) {
        shouldAllowChange = NO;
        [ newReplacement deleteCharactersInRange:NSMakeRange( i, 1 )];
        i--;
    }
}

if ( shouldAllowChange ) {
    [ newReplacement release ];
    return YES;
} else {
    [ textField setText:[[ textField text ]
                         stringByReplacingCharactersInRange:range
                         withString:newReplacement ]];
    [ newReplacement release ];
    return NO;
}
}

 */
