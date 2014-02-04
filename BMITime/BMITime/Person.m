//
//  Person.m
//  BMITime
//
//  Created by Michael Nwani on 12/19/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize heightInMeters, weightInKilos;

- (float)bodyMassIndex{
    float h = [self heightInMeters];
    return [self weightInKilos]/ (h * h);
}

@end
