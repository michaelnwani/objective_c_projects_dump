//
//  BNRItemStore.m
//  Homepwner
//
//  Created by joeconway on 8/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRImageStore.h"
#import "BNRItem.h"


@implementation BNRItemStore

+ (BNRItemStore *)defaultStore
{
    static BNRItemStore *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
        
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init 
{
    self = [super init];
    if(self) {
        //allItems = [[NSMutableArray alloc] init];
        
        NSString *path = [self itemArchivePath];
        
        //NSKeyedUnarchiver is for loading the BNRItems when the application launches
        //Using it at the exact moment BNRItemStore is created, which is every time the app launches.
        //unarchiveObjectWithFile creates an instance of NSKeyedUnarchiver and loads the data of the archive (items.archive) located
        /*at the itemArchivePath into that instance. the NSMutableArray that results from this (because of allItems) 
         is sent initWithCoder: and decodes the objects via NSKeyedUnarchiver.*/
        allItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        //If the array hadn't been saved previously, create a new empty one
        if (!allItems)
        {
            allItems = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}

- (void)removeItem:(BNRItem *)p
{
    //To make sure the image gets deleted from the filesystem if its deleted from the store.
    NSString *key = [p imageKey];
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    
    [allItems removeObjectIdenticalTo:p];
}

- (NSArray *)allItems
{
    return allItems;
}

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to
{
    if (from == to) {
        return;
    }
    // Get pointer to object being moved so we can re-insert it
    BNRItem *p = [allItems objectAtIndex:from];

    // Remove p from array
    [allItems removeObjectAtIndex:from];

    // Insert p in array at new location
    [allItems insertObject:p atIndex:to];
}

- (BNRItem *)createItem
{
    //BNRItem *p = [BNRItem randomItem];
    BNRItem *p = [[BNRItem alloc] init];

    [allItems addObject:p];
   
    return p;
}

//For saving the items to the Documents directory, the only location for save data like this.
- (NSString *)itemArchivePath
{
    //It searches the filesystem for a path that matches our criteria, namely the Documents Directory.
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //Get one and only document directory from that list. It gets an array of strings that possibly matches our search,
    //but in iOS only one string would appear, so we're calling the first index.
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    //Still not sure what items.archive does.Think it's the items file that appears inside the Documents Directory.
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

-(BOOL)saveChanges
{
    //Returns success or failure
    NSString *path = [self itemArchivePath];
    
    //archiveRootObject:toFile: takes care of saving every single BNRItem in allItems to the itemArchivePath
    //Collects recursively. Once all the instance variables have been encoded, the NSKeyedArchiver writes the
    //data it collects to to the path, which is of the Documents directory.
    return [NSKeyedArchiver archiveRootObject:allItems toFile:path];
}
@end
