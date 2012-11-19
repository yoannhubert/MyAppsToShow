//
//  AdressAnnotation.h
//  MapViewApp
//
//  Created by Yoann Hubert on 23/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AdressAnnotation : NSObject <MKAnnotation> {
    
	NSString *title;
	CLLocationCoordinate2D coordinate;
    MKPinAnnotationColor pinColor;
    
    
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic) MKPinAnnotationColor pinColor;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d;

@end
