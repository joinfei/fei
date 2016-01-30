//
//  ActivityViewCell.h
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILView.h"
@class Activity;

@interface ActivityViewCell : UITableViewCell

@property (nonatomic, retain) UIImageView *posterView;//活动图片
@property (nonatomic, retain) UILabel *titleLabel;//标题
@property (nonatomic, retain) ILView *timeView; //日期
@property (nonatomic, retain) ILView *addrssView; //地址
@property (nonatomic, retain) ILView *typeView; //类型

@property (nonatomic, retain) UILabel *attendLabel; //参加人数
@property (nonatomic, retain) UILabel *wishLabel; //感兴趣人数


@property (nonatomic, retain) Activity *activity;

@end
