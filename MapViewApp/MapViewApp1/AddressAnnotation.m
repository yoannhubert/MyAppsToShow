//
//  AddressAnnotation.m
//  MapViewApp1
//
//  Created by Yoann Hubert on 13/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AddressAnnotation.h"

@implementation AddressAnnotation


@synthesize title, coordinate,pinColor;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	[super init];
	title = ttl;
	coordinate = c2d;
    pinColor=MKPinAnnotationColorRed;
	return self;
}
/*
-(CLLocationCoordinate2D)myFunctionLocationFromTitle :(NSString *)ttl{


}
*/
- (void)dealloc {
	[title release];
	[super dealloc];
}

@end