//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Michael Nwani on 1/3/13.
//  Copyright (c) 2013 Michael Nwani. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self)
    {
        UITabBarItem *tbi = [self tabBarItem];
        
        [tbi setTitle:@"Time"];
        
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:i];
        
        
    }
    
    return self;
}

-(IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    [timeLabel setText:[formatter stringFromDate:now]];
}

-(void)viewDidLoad
{
    //Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"TimeViewController loaded its view");
    
    [[self view] setBackgroundColor:[UIColor greenColor]];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"Current TimeViewController will disappear");
    [super viewWillDisappear:animated];
    
}
@end
