//
//  Movie.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"images"]) {
        self.image = value[@"small"];
    } else if ([key isEqualToString:@"id"]) {
        self.movieID = value;
    }
}


@end
