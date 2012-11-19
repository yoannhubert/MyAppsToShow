//
//  MapViewApp1ViewController.h
//  MapViewApp1
//
//  Created by Yoann Hubert on 11/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@interface MapViewApp1ViewController : UIViewController <NSFetchedResultsControllerDelegate,UITableViewDelegate,UITableViewDataSource>{

   IBOutlet MKMapView *map;
   IBOutlet UISearchBar *searchBar;
  //  NSMutableString *tamponAddress;
    NSMutableArray *annotations;
    IBOutlet UITableView *tableView;

}
@property (nonatomic,retain) MKMapView *map;
@property (nonatomic,retain) NSMutableArray *annotations;
@property (nonatomic,retain) UISearchBar *searchBar;
@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSMutableString *tamponAddress;




-(CLLocationCoordinate2D) addressLocation;
- (void) showAddress;
- (void) searchCoordinatesForAddress:(NSString *)inAddress;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

@end
