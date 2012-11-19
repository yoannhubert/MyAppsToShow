//
//  vc21.m
//  TheBookV2
//
//  Created by Yoann Hubert on 20/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc21.h"
#import "ViewController.h"

@interface vc21 ()

@end

@implementation vc21
@synthesize but21down=_but21down;

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

-(IBAction)moveup:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
    
}

-(IBAction)movedown:(id)sender{
    [[self.storyboard instantiateViewControllerWithIdentifier:@"vc"] move22:sender];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
