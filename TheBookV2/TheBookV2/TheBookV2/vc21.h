//
//  vc21.h
//  TheBookV2
//
//  Created by Yoann Hubert on 20/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vc21 : UIViewController{

    IBOutlet UIButton *but21down;
}
 @property (nonatomic,strong) IBOutlet UIButton *but21down;
-(IBAction)movedown:(id)sender;
-(IBAction)moveup:(id)sender;
@end
