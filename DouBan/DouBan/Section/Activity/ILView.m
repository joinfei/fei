//
//  ILView.m
//  DouBanApp
//
//  Created by 周华定 on 15/9/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//
#define kMarginLeft_ImageView    10
#define kMarginTop_ImageView     5
#define kWidth_ImageView         20

#define kInterSpacing            10 //两者左右间距

#import "ILView.h"

@implementation ILView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加子控件
        [self addSubview:self.imageView];
        [self addSubview:self.textLabel];
    }
    return self;
}

//懒加载创建控件 -- 重写getter方法
- (UIImageView *)imageView {
    if (!_imageView) {
        CGRect frame = CGRectMake(kMarginLeft_ImageView, kMarginTop_ImageView, kWidth_ImageView, kWidth_ImageView);
        self.imageView = [[[UIImageView alloc] initWithFrame:frame] autorelease];
    }
    return [[_imageView retain] autorelease];
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        CGFloat x = CGRectGetMaxX(self.imageView.frame) + kInterSpacing;
        CGRect frame = CGRectMake(x, 0, CGRectGetWidth(self.frame) - x, CGRectGetHeight(self.frame));
        self.textLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
        _textLabel.numberOfLines = 0;
        _textLabel.font = [UIFont systemFontOfSize:14];
    }
    return [[_textLabel retain] autorelease];
}


- (void)dealloc {
    [_imageView release];
    [_textLabel release];
    [super dealloc];
}


@end
