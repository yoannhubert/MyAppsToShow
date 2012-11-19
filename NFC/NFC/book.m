//
//  book.m
//  NFC
//
//  Created by Yoann Hubert on 27/07/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "book.h"

@implementation book

@synthesize bookID;
@synthesize nfc;
@synthesize mobile;


@synthesize linksnfc;
@synthesize linksrfid;
@synthesize link;
@synthesize name;
@synthesize mark;
@synthesize plateform;



- (void) dealloc {
    
    
    [link release];
    [plateform release];
    [mark release];
    [name release];
    
    [linksrfid release];
    [linksnfc release];
    [mobile release];
    [nfc release];
    
    [super dealloc];
}

@end


