//
//  vc2.m
//  TheBookV2
//
//  Created by Yoann Hubert on 05/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc2.h"

@interface vc2 ()

@end

@implementation vc2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self=[self.storyboard instantiateViewControllerWithIdentifier:@"vc2"];
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
