//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Michael Nwani on 1/3/13.
//  Copyright (c) 2013 Michael Nwani. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //Call the superlcass's designated initializer
    self = [super initWithNibName:nil bundle:nil];
    
    if (self)
    {
        //Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        //Give it a label
        [tbi setTitle:@"Hypnosis"];
        
        //Create a UIImage from a fmile
        //This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        //Put that image on the tab bar item
        [tbi setImage:i];
    }
    
    return self;
}

-(void)loadView
{
    //Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    //Set it as *THE* view of this view controller
    [self setView:v];
}
-(void)viewDidLoad
{
    //Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view");
    
}

@end
