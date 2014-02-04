//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Michael Nwani on 12/30/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    //For displaying the map and the labels for the recorded locations.
    IBOutlet MKMapView *worldView;
    //Indicates that the device is working and not stalled.
    IBOutlet UIActivityIndicatorView *activityIndicator;
    //Allows the user to input text to label the current location on the map
    IBOutlet UITextField *locationTitleField;
}

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;


@end
