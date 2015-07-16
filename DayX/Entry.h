//
//  Entry.h
//  DayX
//
//  Created by Douglas Goodwin on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSString *titleKey = @"titleKey";
static const NSString *timeStampKey = @"timeStampKey";
static const NSString *bodyTextKey = @"bodyTextKey";

@interface Entry : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *bodyText;
@property (strong, nonatomic) NSDate *timeStamp;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
