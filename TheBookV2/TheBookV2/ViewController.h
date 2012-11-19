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


}
@property (nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain) IBOutlet UIPageControl *pageControl;

- (IBAction)addPhoto:(id)sender;

-(IBAction)move1:(id)sender;

-(IBAction)move2:(id)sender;
-(IBAction)move12:(id)sender;
-(IBAction)move22:(id)sender;
-(IBAction)moveup:(id)sender;

@end
