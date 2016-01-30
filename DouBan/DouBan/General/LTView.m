//
//  LTView.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LTView.h"
@interface LTView ()<UITextFieldDelegate>

@end


@implementation LTView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //leftLabel
        [self setleft];
        //rightTF
        [self setright];
    }
    return self;

    
    
}
//- (instancetype)initWithFrame:(CGRect)frame leftText:(NSString *)text placeholder:(NSString *)placeholder {
//    //self = [super initWithFrame:frame];
//    if (self) {
//        //leftLabel
//        [self setleft];
//        //rightTF
//        [self rightTF];
//    }
//    return self;
//}

- (void)setleft{
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0 ,70, 30)];
    

    [self addSubview:_leftLabel];
    [_leftLabel release];
}

- (void)setright{
    self.rightTF  = [[UITextField alloc] initWithFrame:CGRectMake(120,0, 200, 30)];
    _rightTF.borderStyle = UITextBorderStyleRoundedRect;
    _rightTF.userInteractionEnabled = YES;
    _rightTF.delegate = self;
    [self addSubview:_rightTF];
    [_rightTF release];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_rightTF resignFirstResponder];
}



- (void)dealloc {
    self.leftLabel = nil;
    self.rightTF = nil;
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
