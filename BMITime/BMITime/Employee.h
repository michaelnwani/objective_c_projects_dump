//
//  Employee.h
//  BMITime
//
//  Created by Michael Nwani on 12/20/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@class Asset;
@interface Employee : Person
{
    int employeeID;
    NSMutableArray *assets;
}

@property int employeeID;
-(void) addAssetsObject:(Asset *)a;
-(unsigned int)valueOfAssets;

@end
