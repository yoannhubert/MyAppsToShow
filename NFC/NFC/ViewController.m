//
//  ViewController.m
//  NFC
//
//  Created by Yoann Hubert on 16/07/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"
#import "myCustomCell.h"




@interface ViewController ()

@end

@implementation ViewController
@synthesize tbv_rfid, tbv_nfc, tbv_devices;
@synthesize nfclist;
@synthesize nfcD;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.nfclist = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NFC_List" ofType:@"plist"]];
   
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



#pragma mark - Table view data source delegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(tableView == self.tbv_devices){
        return [[nfclist valueForKey:@"Mobile"]count];
    }
    if(tableView == self.tbv_nfc){
        return [[nfclist valueForKey:@"Web_links_NFC"]count];
    }
    if(tableView == self.tbv_rfid){
        return [[nfclist valueForKey:@"Web_links_RFID"]count];
    }
    else return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"myCustomCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"myCustomCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
        
        
    }
	
    // Set Value for each cell
    //-------------------------
    if(tableView == self.tbv_devices){
    NSString *mobile=[[nfclist valueForKey:@"Mobile"]objectAtIndex:indexPath.row];
        cell.textLabel.text=mobile; 
    }
    if(tableView == self.tbv_nfc){
       NSString *nfc=[[nfclist valueForKey:@"Web_links_NFC"]objectAtIndex:indexPath.row];
        cell.textLabel.text =nfc;
    }
    if(tableView == self.tbv_rfid){
       NSString *rfid=[[nfclist valueForKey:@"Web_links_RFID"]objectAtIndex:indexPath.row];
        cell.textLabel.text =rfid;
    }
    
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Set up the cell
    return cell;
}


#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString * myUrl= cell.textLabel.text;
    
    if(tableView == self.tbv_rfid || tableView==self.tbv_nfc ){
        NSString *ht=@"http://";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ht,myUrl]]];                                                                
        
    }
    else if (tableView==tbv_devices){
        myUrl = [myUrl stringByReplacingOccurrencesOfString:@" "
                                                 withString:@"+"];       
        NSString *ht=@"http://www.google.fr/search?q=";       
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ht,myUrl]]]; 
    }
}





@end
