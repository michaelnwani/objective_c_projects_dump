//
//  Employee.m
//  BMITime
//
//  Created by Michael Nwani on 12/20/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import "Employee.h"
#import "Asset.h"

@implementation Employee

@synthesize employeeID;

-(void)addAssetsObject:(Asset *)a
{
    // Is assets nil?
    if (!assets){
        //Create the array
        assets = [[NSMutableArray alloc] init];
    }
    
    [assets addObject:a];
    [a setHolder:self];
}

- (unsigned int)valueOfAssets
{
    //Sum up the resale value of the assets
    unsigned int sum = 0;
    for (Asset *a in assets){
        sum += [a resaleValue];
    }
    
    return sum;
}

- (float) bodyMassIndex{
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %d: $%d in assets>", [self employeeID], [self valueOfAssets]];
}

-(void) dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
