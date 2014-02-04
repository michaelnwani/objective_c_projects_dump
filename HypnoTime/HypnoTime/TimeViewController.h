//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Michael Nwani on 1/3/13.
//  Copyright (c) 2013 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    IBOutlet UILabel *timeLabel;
}

-(IBAction) showCurrentTime:(id)sender;

@end
