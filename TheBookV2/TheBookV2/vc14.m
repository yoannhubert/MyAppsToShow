//
//  vc14.m
//  TheBookV2
//
//  Created by Yoann Hubert on 06/09/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc14.h"

@interface vc14 ()

@end

@implementation vc14

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(IBAction)moveup:(id)sender{

[self dismissModalViewControllerAnimated:YES];
}

@end
