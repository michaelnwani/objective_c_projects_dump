//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Michael Nwani on 12/31/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

    
@synthesize coordinate, title;
-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if (self)
    {
        coordinate = c;
        //Comes from the MKAnnotation protocol. (What gets displayed with entering a location name on the map)
        [self setTitle:t];
        
    }
    
    return self;
}



-(id)init
{
   
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}
@end
