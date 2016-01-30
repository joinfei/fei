//
//  UILabel+Addition.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text alignment:(NSTextAlignment)aligment {
    self = [self initWithFrame:frame];
    if (self) {
        self.text = text;
        self.textAlignment = aligment;
    }
    return self;
}

@end
