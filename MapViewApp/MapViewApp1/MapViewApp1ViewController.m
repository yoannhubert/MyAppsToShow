//
//  MapViewApp1ViewController.m
//  MapViewApp1
//
//  Created by Yoann Hubert on 11/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewApp1ViewController.h"
#import "AddressAnnotation.h"
#import "SBJson.h"
#import "myCustomCell.h"
#import <CoreData/CoreData.h>





@implementation MapViewApp1ViewController
@synthesize map;
@synthesize searchBar;
@synthesize tamponAddress;
@synthesize annotations;
@synthesize tableView;




 CLLocationCoordinate2D location;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    
    self.map.mapType = MKMapTypeStandard;
    CLLocationCoordinate2D coord ={50.8503396, 4.3517103};
    MKCoordinateSpan span={0.2,0.2};
    MKCoordinateRegion region= {coord,span};
    [self.map setRegion:region];
    // Set some coordinates for our position (Buckingham Palace!)
    CLLocationCoordinate2D location;
    location.latitude = (double) 50.8505903;
    location.longitude = (double) 4.4583107;
    
    // Add the annotation to our map view
    AddressAnnotation *newAnnotation = [[AddressAnnotation alloc] initWithTitle:@"Stone Age" andCoordinate:location];
    newAnnotation.pinColor=MKPinAnnotationColorPurple;
    
    self.annotations=[[NSMutableArray alloc] initWithObjects: nil];
    
    [self.map addAnnotation:newAnnotation];
    [self.annotations addObject:newAnnotation];
    [newAnnotation release];
    
    
    self.tableView.tableHeaderView.backgroundColor=[UIColor purpleColor];
    UIView *containerView =[[[UIView alloc]initWithFrame:CGRectMake(10,0,100,20)] autorelease];
    UILabel *headerLabel =[[[UILabel alloc]initWithFrame:CGRectMake(10,0,100, 20)]autorelease];
    headerLabel.text=NSLocalizedString (@"Annotations",@"");
    headerLabel.textColor=[UIColor whiteColor];
    headerLabel.shadowColor=[UIColor blackColor];
    headerLabel.shadowOffset=CGSizeMake(0,0);
    headerLabel.font=[UIFont boldSystemFontOfSize:14];
    headerLabel.backgroundColor=[UIColor purpleColor];    
    [containerView addSubview:headerLabel];
    
    self.tableView.tableHeaderView=containerView;
    [self.tableView.tableHeaderView sizeToFit]; 
    [self.tableView.tableHeaderView setTag:1];
 
    
    [super viewDidLoad];
   
    
 
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar 
{
    self.tamponAddress=[NSString stringWithFormat:@" %@",[self.searchBar text]];
    //Perform the JSON query.
     [self searchCoordinatesForAddress:[self.searchBar text]];
    
    //Hide the keyboard.
     [searchBar resignFirstResponder];
    [self.tableView reloadData];
    
    //  [googleLocalConnection getGoogleObjectsWithQuery:sBar.text andMapRegion:[mapView region] andNumberOfResults:8 addressesOnly:YES andReferer:@"http://maps.google.com/maps/geo?q=%@?output=json"];
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.tableView reloadData];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";   
    if ([annotation isKindOfClass:[AddressAnnotation class]]) {
        AddressAnnotation *location = (AddressAnnotation *) annotation;
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.map dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        
        
        if ([location.title compare:@"Stone Age"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorPurple;
        } else if ([location.title compare:@"AUTO THEFT"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorGreen;
        } else if ([location.title compare:@"BURGLARY"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorGreen;
        } else if ([location.title compare:@"New Address"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorRed;
        } else if ([location.title compare:@"BATTERY"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorRed;
        } else if ([location.title compare:@"AGG. ASSAULT"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorRed;
        } else {
            NSLog(@"Unknown: %@", location.title);
            annotationView.pinColor = MKPinAnnotationColorRed; // Others will be RED
        }
        return annotationView;
    }
    
    return nil;    
}
- (void) searchCoordinatesForAddress:(NSString *)inAddress
{
    //Build the string to Query Google Maps.
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@?output=json",inAddress];
    
    //Replace Spaces with a '+' character.
    [urlString setString:[urlString stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
    
    //Create NSURL string from a formate URL string.
    NSURL *url = [NSURL URLWithString:urlString];
    
    //Setup and start an async download.
    //Note that we should test for reachability!.
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection release];
    [request release];
}

//It's called when the results of [[NSURLConnection alloc] initWithRequest:request delegate:self] come back.
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{   
    //The string received from google's servers
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //JSON Framework magic to obtain a dictionary from the jsonString.
    NSDictionary *results = [jsonString JSONValue];
    
    //Now we need to obtain our coordinates
    NSArray *placemark  = [results objectForKey:@"Placemark"];
    NSArray *coordinates = [[placemark objectAtIndex:0] valueForKeyPath:@"Point.coordinates"];
    
    //I put my coordinates in my array.
    double longitude = [[coordinates objectAtIndex:0] doubleValue];
    double latitude = [[coordinates objectAtIndex:1] doubleValue];
    
    //Debug.
    //NSLog(@"Latitude - Longitude: %f %f", latitude, longitude);
    
    //I zoom my map to the area in question.
    //  [self.map zoomMapAndCenterAtLatitude:latitude andLongitude:longitude];
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.2;
    span.longitudeDelta=0.2;
   // region={coord,span};
    
    CLLocationCoordinate2D location = {latitude,longitude};
    region.span=span;
    region.center=location;
  
     
    
    // Add the annotation to our map view
    AddressAnnotation *newAnnotation = [[AddressAnnotation alloc] initWithTitle:self.tamponAddress andCoordinate:location];
    newAnnotation.pinColor=MKPinAnnotationColorRed;       
    [self.map setRegion:region];
    [self.map addAnnotation:newAnnotation];   

    [self.annotations addObject:newAnnotation];
    [newAnnotation release]; 
    
    [self.tableView reloadData];
    [jsonString release];
   
}


#pragma Mark - Table View Management

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.annotations count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"myCustomCell";
    

    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
      //  cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"myCustomCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    // Configure the cell.
    
    cell.textLabel.text= [[self.annotations objectAtIndex:indexPath.row]title];
    //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    [cell setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.3]];
    bool isSelected = [cell isSelected];
    if (isSelected)
    {
       
        [cell setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.3]];
        [cell setAccessibilityTraits:UIAccessibilityTraitSelected];
    }
    else
    {
        [cell setBackgroundColor:[UIColor clearColor]];       // Define BackgroundColor of the Cell when not selected
        [cell setAccessibilityTraits:0];                      // Background Color Selected is defined by the tableView in Interface Builder
    }                                                         // Or you can use the function below "Did SelectedRowAtIndex ... " the define it when it is selected
}
 
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //First you get the cell you want to change
    UITableViewCell* theCell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    //Then you change the properties (label, text, color etc..) in your case, the background color
    theCell.contentView.backgroundColor=[UIColor colorWithRed:255 green:0 blue:80
                                                        alpha:0.9];
    
    // Relocate section
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.2;
    span.longitudeDelta=0.2;
    
    
    CLLocationCoordinate2D location = [[self.annotations objectAtIndex:indexPath.row]coordinate];
    region.span=span;
    region.center=location;
    [self.map setRegion:region];
    
    
    //Deselect the cell if you can see the color change    
   // [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}





/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}





@end
