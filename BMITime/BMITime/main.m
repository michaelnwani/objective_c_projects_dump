//
//  main.m
//  BMITime
//
//  Created by Michael Nwani on 12/19/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"Value of assets" ascending:YES];
        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
        for (int i = 0; i < 10; i++){
            
            Employee *person = [[Employee alloc] init];
            
            //Giving the instance variables values
            [person setHeightInMeters: 1.8 - i/10.0];
            [person setWeightInKilos:90 + i];
            [person setEmployeeID:i];
            
            [employees addObject:person];
            
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++){
            Asset *asset = [[Asset alloc] init];
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop: %d", i];
            [asset setLabel:currentLabel];
            [asset setResaleValue:i * 17];
            
            //Get a random number between 0 and 9 inclusive
            NSUInteger randomIndex = random() % [employees count];
            
            //Find that employee
            Employee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            [randomEmployee addAssetsObject:asset];
            [allAssets addObject:asset];
        }
        
        
        
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        
        [employees removeObjectAtIndex:5];
        
        NSLog(@"allAssets: %@", allAssets);
        
        NSLog(@"Giving up ownership of array");
        allAssets = nil;
        employees = nil;
    }
    sleep(100);
    return 0;
}

