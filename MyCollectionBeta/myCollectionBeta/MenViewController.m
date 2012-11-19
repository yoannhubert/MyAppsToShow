//
//  MenViewController.m
//  myCollectionBeta
//
//  Created by Yoann Hubert on 23/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "MenViewController.h"
#import "myPresentationItemsController.h"

@class myPresentationItemsController;

@interface MenViewController ()

@end

@implementation MenViewController
@synthesize scrollViewTop=_scrollViewTop;
@synthesize scrollViewBottom=_scrollViewBottom;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _scrollViewTop.delegate=self;
        _scrollViewBottom.delegate=self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  /*  CGRect frame;
    frame.size=_scrollViewTop.contentSize;
    frame.origin=_scrollViewTop.contentOffset;
    
    UIView *myContainer=[[UIView alloc]initWithFrame:frame];
    
    // [[myContainer addSubview:[UILabel alloc]i]];
   // for(int i=0;i<numberOfItems;i++){
    myPresentationItemsController *viewforItems=[[myPresentationItemsController alloc]init];
    viewforItems.myImageforItem.image=[UIImage imageNamed:@"images-1.jpeg"];
   [myContainer addSubview:viewforItems.myContainerItems];
    [_scrollViewTop addSubview:myContainer];
    */
    CGFloat contentWidth=4900;
   // CGFloat contentHeight=_scrollViewTop.frame.size.height;
    CGFloat contentHeight=296;
    UIView *contentView = [[UIView alloc]
                           initWithFrame:CGRectMake(0,0,contentWidth,contentHeight)];
    [_scrollViewTop addSubview:contentView];
  //  [_scrollViewTop setContentSize:CGMakeSize(contentWidth,contentHeight)];
    
    
   // }

}

-(void)settingforTopScrollView{
    
    

}
-(void)settingforBottomScrollView{


}

- (void)viewDidUnload
{
    [scrollViewTop release];
    scrollViewTop = nil;
    [scrollViewBottom release];
    scrollViewBottom = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)dealloc {
    [scrollViewTop release];
    [scrollViewBottom release];
    [super dealloc];
}
@end
