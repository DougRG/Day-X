//
//  Entry.m
//  DayX
//
//  Created by Douglas Goodwin on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"


@implementation Entry

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        
        self.timeStamp = dictionary[timeStampKey];
        self.title = dictionary[titleKey];
        self.bodyText = dictionary[bodyTextKey];
    }
    
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    if (self.title) {
        [dictionary setObject:self.title forKey:titleKey];
    }
    if (self.timeStamp) {
        [dictionary setObject:self.timeStamp forKey:timeStampKey];
    }
    if (self.bodyText) {
        [dictionary setObject:self.bodyText forKey:bodyTextKey];
    }

    return dictionary;
    
}
@end