//
//  myPresentationItemsController.m
//  myCollectionBeta
//
//  Created by Yoann Hubert on 28/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "myPresentationItemsController.h"

@interface myPresentationItemsController ()

@end

@implementation myPresentationItemsController
@synthesize refItems=_refItems;
@synthesize descriptionItems=_descritionItems;
@synthesize priceItems=_priceItems;
@synthesize sizeItems=_sizeItems;
@synthesize myPickerSize=_myPickerSize;
@synthesize myImageforItem=_myImageforItem;
@synthesize myContainerItems=_myContainerItems;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)launchPicker:(id)sender{



}

-(IBAction)addtoCart:(id)sender{


}
@end
