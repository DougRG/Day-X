//
//  EntryController.m
//  DayX
//
//  Created by Douglas Goodwin on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"

@interface EntryController ()

@property (strong, nonatomic) NSArray *entries;

@end



@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
   
    sharedInstance.entries = [NSArray new];
    
    });
    
    
    
    return sharedInstance;
}

- (void)addEntry:(Entry *)entry {
    NSMutableArray *addmutableEntry = [self.entries mutableCopy];
    
    [addmutableEntry addObject:entry];
    
    self.entries = addmutableEntry;

}

-(void)removeEntry:(Entry *)entry {
    
    
    NSMutableArray *removiemutableEntry = [self.entries mutableCopy];
    
    [removiemutableEntry removeObject:entry];
    
    self.entries = removiemutableEntry;
}


@end