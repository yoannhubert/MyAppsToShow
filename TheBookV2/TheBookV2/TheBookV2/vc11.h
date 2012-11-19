//
//  vc11.h
//  TheBookV2
//
//  Created by Yoann Hubert on 11/08/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface vc11 : UIViewController{
   IBOutlet UIButton *but11down;
}

@property (nonatomic,strong) IBOutlet UIButton *but11down;
-(IBAction)moveup:(id)sender;
-(IBAction)movedown:(id)sender;
@end
