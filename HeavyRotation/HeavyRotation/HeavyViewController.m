//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Michael Nwani on 1/14/13.
//  Copyright (c) 2013 Michael Nwani. All rights reserved.
//

#import "HeavyViewController.h"

@interface HeavyViewController ()

@end

@implementation HeavyViewController

-(BOOL)shouldAutorotate{
    //Return YES if incoming orientation is portrait
    // or either of the landscapes, otherwise, return NO
    
    if (UIInterfaceOrientationPortrait){
        return UIInterfaceOrientationPortrait;
    }
    if (UIInterfaceOrientationLandscapeLeft){
        return UIInterfaceOrientationLandscapeLeft;
    }
    if (UIInterfaceOrientationLandscapeRight)
    {
        return UIInterfaceOrientationLandscapeRight;
    }
    
}

@end


