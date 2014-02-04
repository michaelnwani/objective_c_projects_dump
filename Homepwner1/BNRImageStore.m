//
//  BNRImageStore.m
//  Homepwner1
//
//  Created by Michael Nwani on 2/4/13.
//
//

#import "BNRImageStore.h"

@implementation BNRImageStore

+(id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

+(BNRImageStore *)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore)
    {
        //Create the singleton
        sharedStore = [[super allocWithZone:NULL] init];
    }
    
    return sharedStore;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        dictionary = [[NSMutableDictionary alloc] init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        //A low memory warning will send the message clearCache: to the BNRImageStore instance
        [nc addObserver:self selector:@selector(clearCache:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    
    return self;
}

-(void)clearCache:(NSNotification *)note
{
    NSLog(@"Flushing %d images out of the cache", [dictionary count]);
    //The images can be instantly re-created once the app is loaded again.
    [dictionary removeAllObjects];
}

-(void)setImage:(UIImage *)i forKey:(NSString *)s
{
    [dictionary setObject:i forKey:s];
    
    //Create full path for image
    NSString *imagePath = [self imagePathForKey:s];
    
    //Turn image into a JPEG
    //NSData *d = UIImageJPEGRepresentation(i, 0.5);
    //I changed it to a PNG
    NSData *d = UIImagePNGRepresentation(i);
    
    //Write it to full path. Writing atomatically prevents data corruption in case of crash.
    [d writeToFile:imagePath atomically:YES];
     
}

-(UIImage *)imageForKey:(NSString *)s
{
    //If possible, get it from the dictionary
    UIImage *result = [dictionary objectForKey:s];
    
    if (!result)
    {
        //Create UIImage object from file
        result = [UIImage imageWithContentsOfFile:[self imagePathForKey:s]];
        
        //If we found an image on the file system, place it into the cache
        if (result)
        {
            [dictionary setObject:result forKey:s];
        }
        else
        {
            NSLog(@"Error: unable to find %@", [self imagePathForKey:s]);
        }
    }
    
    return result;
}

-(void)deleteImageForKey:(NSString *)s
{
    if (!s)
    {
        return;
    }
    [dictionary removeObjectForKey:s];
    
    NSString *path = [self imagePathForKey:s];
    [[NSFileManager defaultManager] removeItemAtPath:path error:NULL];
}

//For creating a path in the Documents directory for saving images
-(NSString *)imagePathForKey:(NSString *)key
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:key];
}
@end
