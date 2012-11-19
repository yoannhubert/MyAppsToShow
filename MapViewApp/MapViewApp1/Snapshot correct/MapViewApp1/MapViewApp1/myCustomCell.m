//
//  myCustomCell.m
//  MapViewApp1
//
//  Created by Yoann Hubert on 1/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "myCustomCell.h"

@implementation myCustomCell

@synthesize celltext;
@synthesize viewForBackground;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        celltext=[[UILabel alloc]init];
        celltext.textAlignment=UITextAlignmentLeft;
        celltext.font=[UIFont systemFontOfSize:8];
        viewForBackground=[[UIView alloc]init];
        [self.contentView addSubview:viewForBackground];
        [self.contentView addSubview:celltext];
    }
    return self;
}

    

    

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
