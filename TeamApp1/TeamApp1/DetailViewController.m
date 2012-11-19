//
//  DetailViewController.m
//  TeamApp1
//
//  Created by Yoann Hubert on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

#import "RootViewController.h"
#import "ModalViewController.h"
#import <MapKit/MapKit.h>
#import "AdressAnnotation.h"



@interface DetailViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation DetailViewController


@synthesize toolbar = _toolbar;
@synthesize toolbarBar=_toolbarBar;
@synthesize title=__title;
@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize detailGoalLabel = _detailGoalLabel;
@synthesize detailNameLabel = _detailNameLabel;
@synthesize detailTimesLabel = _detailTimesLabel;
@synthesize detaildeletedLabel=_detaildeletedLabel;
//@synthesize detailPresentLevelLabel = _detailPresentLevelLabel;
//@synthesize detailWishingLevelLabel = _detailWishingLevelLabel;
@synthesize popoverController = _myPopoverController;
@synthesize rootViewController = _rootViewController;
@synthesize modalViewController=_modalViewController;
@synthesize photoViewj=_photoViewj;
@synthesize rightWrong=_rightWrong;
@synthesize eval=_eval;
@synthesize map=_map;
@synthesize region=_region;
@synthesize delegate;
@synthesize address=_address;
@synthesize objofmonth=_objofmonth;


#pragma mark - Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(NSManagedObject *)managedObject
{
	if (_detailItem != managedObject) {
		[_detailItem release];
		_detailItem = [managedObject retain];
		
        // Update the view.
        [self configureView];
	}
    
    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }		
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";   
    if ([annotation isKindOfClass:[AdressAnnotation class]]) {
        AdressAnnotation *location = (AdressAnnotation *) annotation;
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [_map dequeueReusableAnnotationViewWithIdentifier:identifier];
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
        } else if ([location.title compare:@"ROBBERY"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorRed;
        } else if ([location.title compare:@"BATTERY"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorRed;
        } else if ([location.title compare:@"AGG. ASSAULT"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorRed;
        } else {
            NSLog(@"Unknown: %@", location.title);
        }
        return annotationView;
    }
    
    return nil;    
}
-(void)configureView
{
    // Update the user interface for the detail item.

    // Normally should use accessor method, but using KVC here avoids adding a custom class to the template.
    //self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
  
    self.detailGoalLabel.hidden=NO;
    self.detailNameLabel.hidden=NO;
    self.detailTimesLabel.hidden=NO;
    self.detailDescriptionLabel.hidden=NO;
    self.address.hidden=NO;
    self.detaildeletedLabel.hidden=YES;
    self.map.hidden=NO;
    self.objofmonth.hidden=NO;
    //[self.objofmonth.text sizeWithFont:[UIFont fontWithName:@"Helveltica" size:19]];
    self.rightWrong.hidden=NO;
    self.eval.hidden=NO;
    int X = self.detailGoalLabel.frame.origin.x;
    int Y = self.detailGoalLabel.frame.origin.y;
    int w = self.detailGoalLabel.frame.size.width;
    int h = self.detailGoalLabel.frame.size.height;
    
    self.detailDescriptionLabel.frame=CGRectMake(X,Y+28,w,h);
   // self.detailTimesLabel.frame=CGRectMake(X,Y+56,w,h);
   // self.detailWishingLevelLabel.hidden=NO;
  //  self.detailPresentLevelLabel.hidden=NO;
    
    self.detailDescriptionLabel.text =[NSString stringWithFormat:@"Current Level :  %@", [[self.detailItem valueForKey:@"level"] description]];
    
    self.detailGoalLabel.text=[NSString stringWithFormat:@"Objective       :  %@", [[self.detailItem valueForKey:@"goal"] description]];
    
    self.detailTimesLabel.text=[NSString stringWithFormat:@"Training a week :  %@", [[self.detailItem valueForKey:@"timesaweek"] description]];
    
    self.address.text=[NSString stringWithFormat:@"Address :  %@", [[self.detailItem valueForKey:@"postcode"] description]];
    
    self.objofmonth.text=[NSString stringWithFormat:@"Objectives of the month :   %@", [[self.detailItem valueForKey:@"objofmonth"] description]];
    
    self.detailNameLabel.text = [[self.detailItem valueForKey:@"firstName"] description];
      
    // Handling the mapView
    //---------------------------------------------------
    self.map.mapType = MKMapTypeStandard;
    CLLocationCoordinate2D coord ={50.8503396, 4.3517103};
    MKCoordinateSpan span={0.1,0.1};
    MKCoordinateRegion region= {coord,span};    
    [self.map setRegion:region];
        // Set some coordinates for our position (Buckingham Palace!)
        CLLocationCoordinate2D location;
        location.latitude = (double) 50.8505903;
        location.longitude = (double) 4.4583107;
    
        // Add the annotation to our map view
        AdressAnnotation *newAnnotation = [[AdressAnnotation alloc] initWithTitle:@"Stone Age" andCoordinate:location];
        newAnnotation.pinColor=MKPinAnnotationColorPurple;
        
        [self.map addAnnotation:newAnnotation];
        [newAnnotation release];
   //-----------------------------------
    
    
   [self.toolbarBar setEnabled:YES];
   self.toolbarBar.title =[[self.detailItem valueForKey:@"firstName"] description];
    
    self.rightWrong.text=self.calculEval;

   UIImage *imgj= [UIImage imageWithData:[self.detailItem valueForKey:@"photo"]];
   [self.photoViewj setImage:imgj];
    
   // self.detailDescriptionLabel.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(NSString *) calculEval{  
    
    unsigned int tempInt1,tempInt2,tempInt3;NSScanner *scanner1,*scanner2,*scanner3;NSNumber *number1, *number2,*number3; 
    
    scanner1 = [NSScanner scannerWithString:[[self.detailItem valueForKey:@"goal"] description]];
    scanner2 = [NSScanner scannerWithString:[[self.detailItem valueForKey:@"level"] description]];
    scanner3 = [NSScanner scannerWithString:[[self.detailItem valueForKey:@"timesaweek"] description]];
    [scanner1 scanHexInt:&tempInt1];[scanner2 scanHexInt:&tempInt2];[scanner3 scanHexInt:&tempInt3];
    number1 = [NSNumber numberWithInt:tempInt1]; number2 = [NSNumber numberWithInt:tempInt2];number3 =[NSNumber numberWithInt:tempInt3];
   /* switch ([number3 intValue]) {
        case 01:return @"Wrong";  break;
        case 02:if([[NSNumber numberWithInt:([number1 intValue] - [number2 intValue])*[number3 intValue]] intValue]>01) {return @"Wrong";} else return @"OK";break;
        case 03:return @"OK";break;
        case 04:return @"Ok, if you are a great sport man"; break;
        case 05:return @"Wrong"; break;
        case 06:return @"Wrong"; break;
        case 07:return @"Wrong";break;            
        default:
            break;
    }
   */ 
   // if ((([number1 intValue] - [number2 intValue])*[number3 intValue]*16)>32){return @"Good";} else return @"Wrong";
    return [NSString stringWithFormat:@"0x%.2X",[[NSNumber numberWithInt:([number1 intValue] - [number2 intValue])*[number3 intValue]] intValue]];   
     
}

#pragma mark - Split view support

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController: (UIPopoverController *)pc
{
    //barButtonItem.title = @"Events";
    barButtonItem.title = @"Players";

    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
 */

- (void)viewDidUnload
{
	[super viewDidUnload];

	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.popoverController = nil;
    
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [_myPopoverController release];
    [_toolbar release];
    [_detailItem release];
    [_detailDescriptionLabel release];
    [_detailGoalLabel release];
    [_detailNameLabel release];
    [_detailTimesLabel release];
    [_detaildeletedLabel release];
    [_myPopoverController release];
    [_rootViewController release];
    [_modalViewController release];
    [_photoViewj release];
    [_rightWrong release];
    [_eval release];
    [_map release];
    [_address release];
    [_objofmonth release];
    

    [super dealloc];
}

#pragma mark - Object insertion

- (IBAction)insertNewObject:(id)sender
{
	[self.rootViewController insertNewObject:sender];	
}


-(IBAction)editProfile:(id)sender
{
    [self.rootViewController editProfile:sender];
    
}




@end
          
/*NSNumer into hex and reverse
 
 
 // NSNumber to hexadecimal NSString:
 
 NSNumber *number;
 NSString *hexString;
 
 number = [NSNumber numberWithInt:12345];
 hexString = [NSString stringWithFormat:@"0x%x", [number intValue]];
 
 // Hexadecimal NSString to NSNumber:
 
 NSScanner *scanner;
 int tempInt;
 
 scanner = [NSScanner scannerWithString:hexString];
 [scanner scanHexInt:&tempInt];
 number = [NSNumber numberWithInt:tempInt];

 
 
 
 */
