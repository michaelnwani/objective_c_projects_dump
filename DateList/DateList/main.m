//
//  main.m
//  DateList
//
//  Created by Michael Nwani on 12/19/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        //NSArray *dateList = [NSArray arrayWithObjects: now, tomorrow, yesterday, nil];
       
        /*for (NSDate *d in dateList){
            NSLog(@"Here is a date: %@", d);
        }*/
        
        /*NSUInteger dateCount = [dateList count];
        for (int i = 0; i < dateCount; i++){
            
            NSDate *d = [dateList objectAtIndex:i];
            NSLog(@"The date at index %i is %@",i,d);
        }*/
        
        NSMutableArray *dateList = [NSMutableArray array];
        [dateList addObject:now];
        [dateList addObject:tomorrow];
        [dateList insertObject:yesterday atIndex:0];
        for (NSDate *d in dateList){
            NSLog(@"The date here is %@", d);
        }
        [dateList removeObjectAtIndex:0];
        
        
        
    }
    
    return 0;
}

