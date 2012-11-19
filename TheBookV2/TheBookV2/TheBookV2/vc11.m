//
//  vc11.m
//  TheBookV2
//
//  Created by Yoann Hubert on 11/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc11.h"
#import "ViewController.h"


@interface vc11 ()


@end

@implementation vc11
@synthesize but11down=_but11down;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      //  self=[self.storyboard instantiateViewControllerWithIdentifier:@"vc11"];
      // _vc=[self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(IBAction)moveup:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
    
}

-(IBAction)movedown:(id)sender{
    [[self.storyboard instantiateViewControllerWithIdentifier:@"vc"] move12:sender];
   
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

@end
