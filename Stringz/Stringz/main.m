//
//  main.m
//  Stringz
//
//  Created by Michael Nwani on 12/21/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString *str = [[NSString alloc] initWithContentsOfFile:@"/Users/michaelnwani/Desktop/tmpcool.txt"
                                          encoding:NSASCIIStringEncoding
                                          error:NULL];
        
        NSLog(@"tmpcool.txt looks like this:\n%@", str);
                
        
        
    }
    
         
        
        
    return 0;
}

