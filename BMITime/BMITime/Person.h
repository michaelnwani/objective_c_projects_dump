//
//  Person.h
//  BMITime
//
//  Created by Michael Nwani on 12/19/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
//Giving it two instance variables, think of them as private members that have to be in braces
float heightInMeters;
int weightInKilos;
}

@property float heightInMeters;
@property int weightInKilos;
- (float)bodyMassIndex;

@end
