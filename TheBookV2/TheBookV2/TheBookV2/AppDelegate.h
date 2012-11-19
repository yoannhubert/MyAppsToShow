//
//  AppDelegate.h
//  TheBookV2
//
//  Created by Yoann Hubert on 02/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {

    IBOutlet UIViewController *viewController;
    IBOutlet UIScrollView *scrollView;

}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) UIViewController *viewController;
@property (nonatomic,retain) UIScrollView *scrollView;


@end
