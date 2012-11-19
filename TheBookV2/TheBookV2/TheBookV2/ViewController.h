//
//  ViewController.h
//  TheBookV2
//
//  Created by Yoann Hubert on 02/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    // ScrollView and stuff 
    IBOutlet UIScrollView *scrollView;
     UIPageControl *pageControl;
     BOOL pageControlBeingUsed;
    
   // ViewController
/*    IBOutlet UIViewController *vc1;
    IBOutlet UIViewController *vc2;
    IBOutlet UIViewController *vc11;
    IBOutlet UIViewController *vc12;
    IBOutlet UIViewController *vc21;
    IBOutlet UIViewController *vc22;
 */   
    //Segue
 //   IBOutlet UIStoryboard *myStoryboard;
  //  IBOutlet UIStoryboardSegue *segue1;
 //   IBOutlet UIStoryboardSegue *segue2;
  /*  IBOutlet UIStoryboardSegue *segue11;
    IBOutlet UIStoryboardSegue *segue12;
    IBOutlet UIStoryboardSegue *segue21;
    IBOutlet UIStoryboardSegue *segue22;*/
    
    
   


}
@property (nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain) IBOutlet UIPageControl *pageControl;
/*
@property (nonatomic,retain) IBOutlet UIViewController *vc1;
@property (nonatomic,retain) IBOutlet UIViewController *vc2;

@property (nonatomic,retain) IBOutlet UIViewController *vc11;
@property (nonatomic,retain) IBOutlet UIViewController *vc12;
@property (nonatomic,retain) IBOutlet UIViewController *vc21;
@property (nonatomic,retain) IBOutlet UIViewController *vc22;
*/

/*
 @property (nonatomic,retain) IBOutlet UIStoryboardSegue *segue1;
@property (nonatomic,retain) IBOutlet UIStoryboardSegue *segue2; 
@property (nonatomic,retain) IBOutlet UIStoryboardSegue *segue12;
@property (nonatomic,retain) IBOutlet UIStoryboardSegue *segue21;
@property (nonatomic,retain) IBOutlet UIStoryboardSegue *segue22;
@property (nonatomic,retain) IBOutlet UIStoryboardSegue *segue11;
@property (nonatomic,retain) IBOutlet UIStoryboard *myStoryboard;
*/
-(IBAction)move1:(id)sender;

-(IBAction)move2:(id)sender;
-(IBAction)move12:(id)sender;
-(IBAction)move22:(id)sender;
-(IBAction)moveup:(id)sender;

@end
