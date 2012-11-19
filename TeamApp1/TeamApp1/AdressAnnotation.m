//
//  AdressAnnotation.m
//  MapViewApp
//
//  Created by Yoann Hubert on 23/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AdressAnnotation.h"

@implementation AdressAnnotation

@synthesize title, coordinate,pinColor;

- (id)initWithTitle:(NSString *)ttl  andCoordinate:(CLLocationCoordinate2D)c2d {
	[super init];
	title = ttl;
	coordinate = c2d;
    
    
	return self;
}

- (void)dealloc {
	[title release];
	[super dealloc];
}

@end
