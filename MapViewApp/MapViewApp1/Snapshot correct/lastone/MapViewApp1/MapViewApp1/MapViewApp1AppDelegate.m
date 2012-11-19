//
//  MapViewApp1AppDelegate.m
//  MapViewApp1
//
//  Created by Yoann Hubert on 11/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewApp1AppDelegate.h"

#import "MapViewApp1ViewController.h"
#import <MapKit/MapKit.h>

@implementation MapViewApp1AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    self.viewController.map.mapType = MKMapTypeStandard;
    CLLocationCoordinate2D coord ={50.8503396, 4.3517103};
    MKCoordinateSpan span={0.2,0.2};
    MKCoordinateRegion region= {coord,span};    
    [self.viewController.map setRegion:region];
    // Set some coordinates for our position (Buckingham Palace!)
    CLLocationCoordinate2D location;
    location.latitude = (double) 50.8505903;
    location.longitude = (double) 4.4583107;
    
    // Add the annotation to our map view
    AddressAnnotation *newAnnotation = [[AddressAnnotation alloc] initWithTitle:@"Stone Age" andCoordinate:location];
    newAnnotation.pinColor=MKPinAnnotationColorPurple;
  // Add annotation in the list
   NSMutableArray *array=[[NSMutableArray alloc] initWithObjects:[newAnnotation title], nil];
    self.viewController.annotations=array;
    [array release];
    
    
 
    //[self.viewController.annotations addObject:newAnnotation];


    
    [self.viewController.map addAnnotation:newAnnotation];
    [newAnnotation release];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
