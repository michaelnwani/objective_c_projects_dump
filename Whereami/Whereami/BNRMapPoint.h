//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Michael Nwani on 12/31/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>

//A new designated initializer for instances of BNRMapPoint.


- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

//Required property from MKAnnotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


//Optional property from MKAnnotation
@property (nonatomic, copy) NSString *title;


@end

