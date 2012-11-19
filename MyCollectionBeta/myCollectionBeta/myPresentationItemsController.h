//
//  myPresentationItemsController.h
//  myCollectionBeta
//
//  Created by Yoann Hubert on 28/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myPresentationItemsController : UIViewController{

    IBOutlet UILabel *descriptionItems;
    IBOutlet UILabel *refItems;
    IBOutlet UILabel *priceItems;
    IBOutlet UILabel *sizeItems;
    IBOutlet UIPickerView *myPikcerSize;
    IBOutlet UIImageView *myImageforItem;
    
    


}

@property (nonatomic,retain) IBOutlet UILabel *descriptionItems;
@property (nonatomic,retain) IBOutlet UILabel *refItems;
@property (nonatomic,retain) IBOutlet UILabel *priceItems;
@property (nonatomic,retain) IBOutlet UILabel *sizeItems;
@property (nonatomic,retain) IBOutlet UIPickerView *myPickerSize;
@property (nonatomic,retain) IBOutlet UIImageView *myImageforItem;
@property (nonatomic,retain) IBOutlet UIView *myContainerItems;

-(IBAction)launchPicker:(id)sender;
-(IBAction)addtoCart:(id)sender;

@end
