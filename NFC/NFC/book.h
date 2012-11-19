//
//  book.h
//  NFC
//
//  Created by Yoann Hubert on 27/07/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface book : NSObject  {
   
    NSInteger bookID;
    NSString *nfc; //Same name as the Entity Name.
    NSString *mobile; //Same name as the Entity Name.
    NSString *linksnfc; //Same name as the Entity Name.
    NSString *linksrfid; //Same name as the Entity Name.
    
    NSString *link; //Same name as the Entity Name.
    NSString *name; //Same name as the Entity Name.
    NSString *mark;      //Same name as the Entity Name.
    NSString *plateform;      //Same name as the Entity Name.

}


@property (nonatomic, readwrite) NSInteger bookID;

@property (nonatomic, retain) NSString *nfc;
@property (nonatomic, retain) NSString *mobile;
@property (nonatomic, retain) NSString *linksnfc;
@property (nonatomic, retain) NSString *linksrfid;

@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *mark;
@property (nonatomic, retain) NSString *plateform;


@end
