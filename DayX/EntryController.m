//
//  EntryController.m
//  DayX
//
//  Created by Douglas Goodwin on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString *allEntriesKey = @"allEntriesKey";


@interface EntryController ()

@property  (strong, nonatomic) NSArray *entries;

@end



@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
   
    [sharedInstance loadFromPersistentStorage];
     
     });
     
     return sharedInstance;

}

- (void)addEntry:(Entry *)entry {
    NSMutableArray *addMutableEntry = [self.entries mutableCopy];
    
    [addMutableEntry addObject:entry];
    
    self.entries = addMutableEntry;

}

- (void)removeEntry:(Entry *)entry {
    
    
    NSMutableArray *removeMutableEntry = [self.entries mutableCopy];
    
    [removeMutableEntry removeObject:entry];
    
    self.entries = removeMutableEntry;
}

- (void)saveToPersistentStorage {
    NSMutableArray *persistentMutableArray = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [persistentMutableArray addObject:[entry dictionaryRepresentation]];
}
    [[NSUserDefaults standardUserDefaults]setObject:persistentMutableArray forKey:allEntriesKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)save {
    
    [self saveToPersistentStorage];
    
}

- (void)loadFromPersistentStorage {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:allEntriesKey];
    
    NSMutableArray *entries = [NSMutableArray new];
    
    for (NSDictionary *entry in entryDictionaries) {
        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
    }
    
    self.entries = entries;
    
    }



@end