//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Michael Nwani on 1/1/13.
//  Copyright (c) 2013 Michael Nwani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisView *view;
}
@property (strong, nonatomic) UIWindow *window;

@end
