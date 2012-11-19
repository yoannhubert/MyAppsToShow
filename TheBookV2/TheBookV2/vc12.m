//
//  vc12.m
//  TheBookV2
//
//  Created by Yoann Hubert on 05/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc12.h"

@interface vc12 ()

@end

@implementation vc12
@synthesize viewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self=[self.storyboard instantiateViewControllerWithIdentifier:@"vc12"];
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



@end
