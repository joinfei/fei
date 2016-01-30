//
//  UITextField+Addition.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "UITextField+Addition.h"

@implementation UITextField (Addition)
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder isSecure:(BOOL)isSecure keyBoardType:(UIKeyboardType)keyBoardType {
    self = [self initWithFrame:frame];
    if (self) {
        self.placeholder = placeholder;
        self.secureTextEntry = isSecure;
        self.keyboardType = keyBoardType;
    }
    return self;
}



@end
