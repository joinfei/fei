//
//  LTView.h
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+Addition.h"
#import "UITextField+Addition.h"

@interface LTView : UIView

@property (nonatomic, retain)UILabel *leftLabel;
@property (nonatomic, retain) UITextField *rightTF;

//- (instancetype)initWithFrame:(CGRect)frame leftText:(NSString *)text placeholder:(NSString *)placeholder;

@end
