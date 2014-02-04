//
//  Logger.h
//  Callbacks
//
//  Created by Michael Nwani on 12/21/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject
{
    NSMutableData *incomingData;
}

-(void) sayOuch:(NSTimer *)t;

@end
