//
//  MenViewController.h
//  myCollectionBeta
//
//  Created by Yoann Hubert on 23/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenViewController : UIViewController<UIScrollViewDelegate>
{
    
    IBOutlet UIScrollView *scrollViewBottom;   
    IBOutlet UIScrollView *scrollViewTop;
    int numberOfItems;
}
@property (nonatomic,retain) IBOutlet UIScrollView *scrollViewBottom;
@property (nonatomic,retain) IBOutlet UIScrollView *scrollViewTop;

-(void)settingforTopScrollView;
-(void)settingforBottomScrollView;
@end
