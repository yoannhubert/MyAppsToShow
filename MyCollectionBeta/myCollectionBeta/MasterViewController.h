//
//  MasterViewController.h
//  myCollectionBeta
//
//  Created by Yoann Hubert on 04/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;




@interface MasterViewController : UITableViewController {

    IBOutlet UILabel *loginLabel,*chartLabel,*manLabel,*womanLabel,*contactLabel;
    IBOutlet UIImageView *login,*chart,*man,*woman,*contact;
     
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic,strong) IBOutlet UILabel *loginLabel,*chartLabel,*manLabel,*womanLabel,*contactLabel;
@property (nonatomic,strong)IBOutlet UIImageView *login,*chart,*man,*woman,*contact;
@property(retain) id delegate;

@end
