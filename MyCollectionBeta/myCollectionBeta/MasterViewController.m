//
//  MasterViewController.m
//  myCollectionBeta
//
//  Created by Yoann Hubert on 04/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize loginLabel=_loginLabel,chartLabel=_chartLabel,manLabel=_manLabel,womanLabel=_womanLabel,contactLabel=_contactLabel;
@synthesize login=_login,chart=_chart,man=_man,woman=_woman,contact=_contact;


- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)dealloc
{
    [_detailViewController release];
    [_objects release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.navigationController.navigationBar.hidden=YES;
    [self performSegueWithIdentifier:@"loginSegue" sender:self];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"loginsegue"]){
    
    
    }



}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return 5;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    switch (indexPath.row) {
        case 0:
            self.loginLabel.highlighted=YES;
            self.login.image=[UIImage imageNamed:@"login_rougé"];
            
            break;
        case 1:
            self.chartLabel.highlighted=YES;
            self.chart.image=[UIImage imageNamed:@"caddie-rougé"];
            
            break; 
        case 2:
            self.manLabel.highlighted=YES;
            self.man.image=[UIImage imageNamed:@"men_rougé"];
           
            break;
        case 3:
            self.womanLabel.highlighted=YES;
            self.woman.image=[UIImage imageNamed:@"women_rougé"];
             
            break;
        case 4:
            self.contactLabel.highlighted=YES;
            self.contact.image=[UIImage imageNamed:@"contact_rougé"];
           
    
            break;
        default:
            break;
    }{
       
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
            self.loginLabel.highlighted=NO;
            self.login.image=[UIImage imageNamed:@"login"];
            break;
        case 1:
            self.chartLabel.highlighted=NO;
            self.chart.image=[UIImage imageNamed:@"caddie-gold"];
            break; 
        case 2:
            self.manLabel.highlighted=NO;
            self.man.image=[UIImage imageNamed:@"man"];
            break;
        case 3:
            self.womanLabel.highlighted=NO;
            self.woman.image=[UIImage imageNamed:@"woman"];
            break;
        case 4:
            self.contactLabel.highlighted=NO;
            self.contact.image=[UIImage imageNamed:@"contact"];
            break;
        default:
            break;
    }{
        
    }
}

@end
