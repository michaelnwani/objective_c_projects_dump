//
//  Asset.h
//  BMITime
//
//  Created by Michael Nwani on 12/20/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Employee;
@interface Asset : NSObject
{
    NSString *label;
    unsigned int resaleValue;
    __weak Employee *holder;
}

@property (strong) NSString *label;
@property unsigned int resaleValue;
@property (weak) Employee *holder;

@end
