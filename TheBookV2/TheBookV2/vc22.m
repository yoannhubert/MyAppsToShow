//
//  vc22.m
//  TheBookV2
//
//  Created by Yoann Hubert on 06/09/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc22.h"

@interface vc22 ()

@end

@implementation vc22

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
    //[[self.storyboard instantiateViewControllerWithIdentifier:@"vc"] moveup:sender];
    [self dismissModalViewControllerAnimated:YES];
}
@end
