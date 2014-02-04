//
//  BNRAppDelegate.h
//  iTahDoodle
//
//  Created by Michael Nwani on 12/21/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <UIKit/UIKit.h>
// Declare a helper function that we will use to get a path
// to the location on disk where we can save the to-do list

//NOT part of the BNRAppDelegate class:
NSString *docPath(void);

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton    *insertButton;
    
    NSMutableArray *tasks;
}

-(void) addTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;


@end
