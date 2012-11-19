//
//  MapViewApp1AppDelegate.h
//  MapViewApp1
//
//  Created by Yoann Hubert on 11/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressAnnotation.h"

@class MapViewApp1ViewController;

@interface MapViewApp1AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MapViewApp1ViewController *viewController;

@end
