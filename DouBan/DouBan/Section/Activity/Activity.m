//
//  Activity.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Activity.h"

@implementation Activity

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"%@", key);
}

- (void)dealloc {
    self.title = nil;
    self.wisher_count = nil;
    self.loc_name = nil;
    self.participant_count = nil;
    self.image = nil;
    self.end_time = nil;
    self.begin_time = nil;
    self.address = nil;
    self.category_name = nil;
    [super dealloc];
}

@end
