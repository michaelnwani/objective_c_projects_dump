//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Michael Nwani on 12/30/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@implementation WhereamiViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        //Create location manager object
        locationManager = [[CLLocationManager alloc] init];
        
              
        //Ignore warning for now
        [locationManager setDelegate:self];
        
        //And we want it to be as accurate as possible
        //regardless of how much time/power it takes
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
       
    }
    
    return self;
}
-(void)locationManager:(CLLocationManager *)manager
        didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    
    //How many seconds ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    //CLLocationManager will return the last found location of the
    //device first, you don't want that data in this case.
    //If this location was made more than 3 minutes ago, ignore it
    if (t < -180)
    {
        //This is cached data, you don't want it, keep looking
        return;
    }
    
    [self foundLocation:newLocation];
}

-(void)locationManager:(CLLocationManager *)manager
    didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

-(void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    //Create an instance of BNRMapPoint with the current data
    
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
  
    //Add it to the map view
    [worldView addAnnotation:mp];

    
    
        
    //Zoom to the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    //Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

-(void)dealloc
{
    //tell the location manager to stop sending us messages.
    [locationManager setDelegate:nil];
}

@end
