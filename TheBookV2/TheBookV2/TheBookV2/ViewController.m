//
//  ViewController.m
//  TheBookV2
//
//  Created by Yoann Hubert on 02/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollView=_scrollview;
@synthesize pageControl=_pageControl;
//@synthesize vc1=_vc1,vc2=_vc2,vc11=_vc11,vc12=_vc12,vc21=_vc21,vc22=_vc22;

//@synthesize segue2=_segue2,segue1=_segue1; /*,segue11=_segue11,segue12=_segue12,segue21=_segue21,segue22=_segue22;
//@synthesize myStoryboard=_myStorybord;
//@synthesize storyboard=__storyboard;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // [self prepareForSegue:<#(UIStoryboardSegue *)#> sender:<#(id)#>
    
    
    UIViewController *vc1= [self.storyboard instantiateViewControllerWithIdentifier:@"vc1"];
    UIViewController *vc2= [self.storyboard instantiateViewControllerWithIdentifier:@"vc2"];
   
    UIViewController *vc11= [self.storyboard instantiateViewControllerWithIdentifier:@"vc11"];
    UIViewController *vc21= [self.storyboard instantiateViewControllerWithIdentifier:@"vc21"];
    UIViewController *vc22= [self.storyboard instantiateViewControllerWithIdentifier:@"vc22"];
   
    pageControlBeingUsed = NO;
    [self.scrollView setContentSize:CGSizeMake(768, 985)];
     NSArray *pagestoscroll =[NSArray arrayWithObjects:vc1.view,vc2.view,nil];
    for (int i=0; i<pagestoscroll.count; i++) {
        CGRect frame;
        frame.origin.x=self.scrollView.frame.size.width *i;
        frame.origin.y=0;
        frame.size=self.scrollView.frame.size;
        
        
        UIView *subview= [[UIView alloc]initWithFrame:frame];
        [subview addSubview:[pagestoscroll objectAtIndex:i]];
        
        [self.scrollView addSubview:subview]; 
        
       // [subview release];
     }

    self.scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width * pagestoscroll.count,self.scrollView.frame.size.height); 
    self.pageControl.currentPage = 0;
	self.pageControl.numberOfPages = pagestoscroll.count;
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.scrollView=nil;
	self.pageControl = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma Mark - ScrollView and page Controll Management

-(void) scrollViewDidScroll:(UIScrollView *)sender{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth /2)/pageWidth)+1;
    self.pageControl.currentPage= page;
    
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

-(IBAction)pageChange {
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    pageControlBeingUsed = YES;
    
}
-(IBAction)move1:(id)sender{
    UIViewController *vc11= [self.storyboard instantiateViewControllerWithIdentifier:@"vc11"];
  //  UINavigationController *navig1=[self.storyboard instantiateViewControllerWithIdentifier:@"navig1"];
    //[navig1 pushViewController:vc12 animated:YES];
   // [self performSegueWithIdentifier:@"putnavig1" sender:self];
    
    [self presentViewController:vc11 animated:YES completion:^{
    }];  
}

-(IBAction)move2:(id)sender{
    UIViewController *vc21= [self.storyboard instantiateViewControllerWithIdentifier:@"vc21"];
    [self presentViewController:vc21 animated:YES completion:^{
    }]; 
    /*
    UIViewController *vc21= [self.storyboard instantiateViewControllerWithIdentifier:@"vc21"];
    if (self.interfaceOrientation==UIInterfaceOrientationPortrait){
    vc21.modalPresentationStyle=UIModalPresentationPageSheet;
    }
    else if (self.interfaceOrientation==UIInterfaceOrientationLandscapeRight || self.interfaceOrientation==UIInterfaceOrientationLandscapeLeft){
    vc21.modalPresentationStyle=UIModalPresentationPageSheet;
    }
    vc21.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:vc21 animated:YES];
     
     */
}
-(IBAction)move12:(id)sender{
    UIViewController *vc11= [self.storyboard instantiateViewControllerWithIdentifier:@"vc11"];

    
    [self performSegueWithIdentifier:@"pvc12" sender:vc11];
}

-(IBAction)move22:(id)sender{
    //
    
    UIViewController *vc21= [self.storyboard instantiateViewControllerWithIdentifier:@"vc21"];
  //  UIViewController *vc22= [self.storyboard instantiateViewControllerWithIdentifier:@"vc22"];
   // [self dismissViewControllerAnimated:NO completion:^{}];
 /*   [self dismissViewControllerAnimated:YES completion:^{}];
    [self presentViewController:vc22 animated:YES completion:^{}];
*/
    
    [self performSegueWithIdentifier:@"pvc22" sender:vc21];
    
}

-(IBAction)moveup:(id)sender{

    


}

#pragma Mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segue1"] || [segue.identifier isEqualToString:@"segue2"]){
        

    }
    if([segue.identifier isEqualToString:@"pushvc12"]){
        [self dismissViewControllerAnimated:YES completion:^{}];
         }
    if([segue.identifier isEqualToString:@"pvc22"]){
    
    
    
    }
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{



}


@end
