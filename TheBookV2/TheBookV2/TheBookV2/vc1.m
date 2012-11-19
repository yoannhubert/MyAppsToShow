//
//  vc1.m
//  TheBookV2
//
//  Created by Yoann Hubert on 04/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "vc1.h"

@interface vc1 ()

@end

@implementation vc1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self=[self.storyboard instantiateViewControllerWithIdentifier:@"vc1"];
        
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

#pragma Mark -Segues 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{


}
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    
    
}
@end
