//
//  ActivityDetailViewController.h
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
@interface ActivityDetailViewController : UIViewController

@property (nonatomic, retain) Activity *activity;

@property (nonatomic, retain) UILabel *detailTitle;
@property (nonatomic, retain) UIImageView *detailImage;
@property (nonatomic, retain) UILabel *detailTimeView;
@property (nonatomic, retain)  UILabel *detailAddress;
@property (nonatomic, retain)  UILabel *detailcategoty_name;
@property (nonatomic, retain) UILabel *detailcontent;

@end
