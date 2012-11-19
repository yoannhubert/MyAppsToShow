//
//  DetailViewController.h
//  TeamApp1
//
//  Created by Yoann Hubert on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>
#import "ModalViewController.h"


@class RootViewController;

@class ModalViewController;

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate,MKMapViewDelegate>{

    
   
  IBOutlet ModalViewController *modalViewController;
  IBOutlet UILabel *rightWrong; 
  IBOutlet UILabel *eval; 
  IBOutlet MKMapView *map;
  
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *toolbarBar;

@property (nonatomic, retain) NSManagedObject *detailItem;

@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *detailGoalLabel;
@property (nonatomic, retain) IBOutlet UILabel *detailNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *detailTimesLabel;
@property (nonatomic, retain) IBOutlet UILabel *detaildeletedLabel;
@property (nonatomic, retain) IBOutlet UIImageView *photoViewj;
@property (nonatomic,retain)  UILabel *rightWrong;
@property (nonatomic,retain)  UILabel *eval;
@property (nonatomic,retain) IBOutlet MKMapView *map;
@property (nonatomic) MKCoordinateRegion region;
@property (nonatomic, assign) id<MKMapViewDelegate> delegate;
@property (nonatomic,retain) IBOutlet UILabel *address;
@property (nonatomic,retain) IBOutlet UILabel *objofmonth;


@property (nonatomic, assign) IBOutlet RootViewController *rootViewController;
@property (nonatomic, assign) IBOutlet ModalViewController *modalViewController;


- (IBAction)insertNewObject:(id)sender;
- (IBAction)editProfile:(id)sender;
- (void)configureView;
- (void)setDetailItem:(NSManagedObject *)managedObject;
- (NSString *)calculEval;

    
    


@end
