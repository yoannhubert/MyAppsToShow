//
//  ViewController.h
//  NFC
//
//  Created by Yoann Hubert on 16/07/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;

@interface ViewController : UIViewController 

 {
    
    AppDelegate *appDelegate;
    
     NSDictionary *nfclist;

    IBOutlet UITableView *tbv_devices;
    IBOutlet UITableView *tbv_nfc;
    IBOutlet UITableView *tbv_rfid;
    IBOutlet UILabel *nfcD; 


}

@property (nonatomic,retain) UITableView *tbv_devices;
@property (nonatomic,retain) UITableView *tbv_nfc;
@property (nonatomic,retain) UITableView *tbv_rfid;
@property (nonatomic,retain) NSDictionary *nfclist;
@property (nonatomic,retain) UILabel *nfcD;

@end
