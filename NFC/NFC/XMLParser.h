//
//  XMLParser.h
//  NFC
//
//  Created by Yoann Hubert on 16/07/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppDelegate, book;


@interface XMLParser : NSObject  {
    
    
        NSMutableString *currentElementValue;
        
        AppDelegate *appDelegate;
        book *aBook; 
    }
    
- (XMLParser *) initXMLParser;
    

@end
