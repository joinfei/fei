//
//  RegisterView.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegisterView.h"
#import "LTView.h"
@implementation RegisterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubviews];
    }
    return self ;
}

- (void)setSubviews{
    
    
    NSArray *labelArr = @[@"用户名",@"密码",@"确认密码",@"邮箱",@"联系方式"];
    NSArray *textfieldArr = @[@"请输入用户名",@"请输入密码",@"再次输入密码",@"请输入邮箱名",@"请输入电话号码"];
    for (int i = 0; i < 5; i++) {
        LTView *ltv = [[LTView alloc] initWithFrame:CGRectMake(20, 40+ i *70, 350, 50)];
       // ltv.rightTF.backgroundColor = [UIColor orangeColor];
        ltv.leftLabel.text = labelArr[i];
        ltv.rightTF.placeholder = textfieldArr[i];
        ltv.rightTF.userInteractionEnabled = YES;
        [self addSubview:ltv];
         
        [ltv release];
    }
    
    
}


@end
