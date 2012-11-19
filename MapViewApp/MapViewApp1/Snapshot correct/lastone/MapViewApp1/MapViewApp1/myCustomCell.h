//
//  myCustomCell.h
//  MapViewApp1
//
//  Created by Yoann Hubert on 1/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCustomCell : UITableViewCell {


IBOutlet UILabel *celltext;
IBOutlet UIView *viewForBackground;


}
@property (nonatomic,retain) IBOutlet UILabel *celltext;
@property (nonatomic,retain) IBOutlet UIView *viewForBackground;

@end
