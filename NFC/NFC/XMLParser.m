//
//  XMLParser.m
//  NFC
//
//  Created by Yoann Hubert on 16/07/12.
//  Copyright (c) 2012 Home. All rights reserved.
//


#import "XMLParser.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "book.h"

@class book;
@implementation XMLParser



- (XMLParser *) initXMLParser {
    
    [super init];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
    attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"nfc"]) {
        //Initialize the array.
        appDelegate.books = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"mobile"]) {
        
        //Initialize the book.
        aBook = [[book alloc] init];
        
        //Extract the attribute here.
        aBook.bookID = [[attributeDict objectForKey:@"id"] integerValue];
        
        NSLog(@"Reading id value :%i", aBook.bookID);
    }
    
    NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
    
    if(!currentElementValue) 
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    else
        [currentElementValue appendString:string];
    
    NSLog(@"Processing Value: %@", currentElementValue);
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"nfc"])
        return;
    
    //There is nothing to do if we encounter the Books element here.
    //If we encounter the Book element howevere, we want to add the book object to the array
    // and release the object.
    if([elementName isEqualToString:@"mobile"]) {
        [appDelegate.books addObject:aBook];
        
        [aBook release];
        aBook = nil;
    }
    else 
        [aBook setValue:currentElementValue forKey:elementName];
    
    [currentElementValue release];
    currentElementValue = nil;
}

- (void) dealloc {
    
    [aBook release];
    [currentElementValue release];
    [super dealloc];
}






@end
