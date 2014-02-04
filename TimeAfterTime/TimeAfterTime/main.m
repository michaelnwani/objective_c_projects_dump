//
//  main.m
//  TimeAfterTime
//
//  Created by Michael Nwani on 12/19/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//  Objective-C & iPhone development practice

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1992];
        [comps setMonth:6];
        [comps setDay:24];
        [comps setHour:1];
        [comps setMinute:0];
        [comps setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        
        NSDate *now = [[NSDate alloc]init];
        double d = [now timeIntervalSinceDate:dateOfBirth];
        double minutes = d/60;
        double hours = minutes / 60;
        double days = hours/24;
        NSLog(@"I have been alive for %f days", days);
        
        double years = days/364;
        NSLog(@"Which is about %f years", years);
        
    }
    return 0;
}

