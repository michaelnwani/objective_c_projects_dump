//
//  BNRImageStore.h
//  Homepwner1
//
//  Created by Michael Nwani on 2/4/13.
//
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}
+(BNRImageStore *)sharedStore;

-(void)setImage:(UIImage *)i forKey:(NSString *)s;

-(UIImage *)imageForKey:(NSString *)s;

-(void)deleteImageForKey:(NSString *)s;

//For creating a path in the Documents directory for saving images
-(NSString *)imagePathForKey:(NSString *)key;

@end
