//
//  ActivityViewCell.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#import "ActivityViewCell.h"
#import "Activity.h"
#import "UIImageView+Addition.h"//自己添加的UIImageView分类头文件

#import "UIImageView+WebCache.h"//第三方SDWebImage内的头文件

@implementation ActivityViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //布局子控件
        [self setUpSubview];
    }
    return self;
}

- (void)setUpSubview {
    //背景
    CGRect frame = CGRectMake(10, 10, kScreenWidth - 20, 180);
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:frame];
    bgView.image = [UIImage imageNamed:@"bg_eventlistcell"];
    [self.contentView addSubview:bgView];
    [bgView release];
    //标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, kScreenWidth - 20, 30)];
    [bgView addSubview:_titleLabel];
    [_titleLabel release];
    
    //白色背景
    UIImageView *whiteBG = [[UIImageView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.titleLabel.frame) + 5, 330, 140)];
    whiteBG.image = [UIImage imageNamed:@"bg_share_large"];
    [self.contentView addSubview:whiteBG];
    [whiteBG release];
    
    //布局其他视图
    
    CGRect timeFrame = CGRectMake(0, 5, 220, 30);
    self.timeView = [[[ILView alloc] initWithFrame:timeFrame] autorelease];
    _timeView.imageView.image = [UIImage imageNamed:@"icon_date"];
    [whiteBG addSubview:_timeView];
    
    CGRect addFrame = CGRectMake(0, CGRectGetMaxY(timeFrame) + 5, CGRectGetWidth(timeFrame), CGRectGetHeight(timeFrame));
    self.addrssView = [[[ILView alloc] initWithFrame:addFrame] autorelease];
    _addrssView.imageView.image = [UIImage imageNamed:@"icon_spot"];
    [whiteBG addSubview:_addrssView];
    
    CGRect typeFrame = CGRectMake(0, CGRectGetMaxY(addFrame) + 5, CGRectGetWidth(timeFrame), CGRectGetHeight(timeFrame));
    self.typeView = [[[ILView alloc] initWithFrame:typeFrame] autorelease];
    _typeView.imageView.image = [UIImage imageNamed:@"icon_catalog"];
    [whiteBG addSubview:_typeView];
    
    CGRect photoFrame = CGRectMake(CGRectGetMaxX(typeFrame), 5, 100, 120);
    self.posterView = [[[UIImageView alloc] initWithFrame:photoFrame] autorelease];
    _posterView.image = [UIImage imageNamed:@"picholder"];
    [whiteBG addSubview:_posterView];
    
    CGRect tipFrame1 = CGRectMake(0, CGRectGetMaxY(typeFrame), 80, 30);
    UILabel *wishTip = [[[UILabel alloc] initWithFrame:tipFrame1] autorelease];
    wishTip.text = @"感兴趣:";
    [whiteBG addSubview:wishTip];
    
    CGRect wishFrame = CGRectMake(CGRectGetMaxX(tipFrame1), CGRectGetMaxY(typeFrame), 50, 30);
    self.wishLabel = [[[UILabel alloc] initWithFrame:wishFrame] autorelease];
    _wishLabel.font = [UIFont systemFontOfSize:20];
    _wishLabel.textColor = [UIColor redColor];
    [whiteBG addSubview:_wishLabel];
    
    CGRect tipFrame2 = CGRectMake(CGRectGetMaxX(wishFrame), CGRectGetMinY(wishFrame), 50, 30);
    UILabel *attendTip = [[[UILabel alloc] initWithFrame:tipFrame2] autorelease];
    attendTip.text = @"参加:";
    [whiteBG addSubview:attendTip];
    
    CGRect attendFrame = CGRectMake(CGRectGetMaxX(tipFrame2), CGRectGetMinY(tipFrame2), 50, 30);
    self.attendLabel = [[[UILabel alloc] initWithFrame:attendFrame] autorelease];
    _attendLabel.font = [UIFont systemFontOfSize:20];
    _attendLabel.textColor = [UIColor redColor];
    [whiteBG addSubview:_attendLabel];

}

- (void)setActivity:(Activity *)activity {
    if (_activity != activity) {
        [_activity release];
        _activity = [activity retain];
    }
    //为控件赋值
    self.titleLabel.text = activity.title;
    self.addrssView.textLabel.text = activity.address;
    self.typeView.textLabel.text = activity.category_name;
//#warning 感兴趣数 和 参加数 后台返回的NSNumber类型 需对Activity类做修改
    self.wishLabel.text = [activity.wisher_count stringValue] ;
    
    self.attendLabel.text = [activity.participant_count stringValue];;
    //从开始时间和结束时间中截取显示时间,再拼接
    NSLog(@"%@  %@",activity.begin_time,activity.end_time);
    NSString *beginTime = [activity.begin_time substringWithRange:NSMakeRange(5, 11)];
    NSString *endTime = [activity.end_time substringWithRange:NSMakeRange(5, 11)];
    self.timeView.textLabel.text = [NSString stringWithFormat:@"%@ -- %@", beginTime, endTime];

    /*使用自己添加的方法 完成图片的异步缓存加载 */
//      [self.posterView setImageWithImageURL:activity.image placeholder:[UIImage imageNamed:@"picholder"]];
//   
//    /*使用第三方SDWebImage添加的方法 完成图片的异步缓存加载 */
    [self.posterView sd_setImageWithURL:[NSURL URLWithString:activity.image] placeholderImage:[UIImage imageNamed:@"picholder"]];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
