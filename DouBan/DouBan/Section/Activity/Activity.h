//
//  Activity.h
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject

@property (nonatomic, copy) NSString *address;//地址
@property (nonatomic, copy) NSString *begin_time;//开始时间
@property (nonatomic, copy) NSString *end_time;//结束时间
@property (nonatomic, copy) NSString *category_name;//类型
@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSNumber *participant_count;//参与者
@property (nonatomic, copy) NSNumber *wisher_count;//感兴趣
@property (nonatomic, copy) NSString *image;//图片
@property (nonatomic, copy) NSString *content;//内容
@property (nonatomic, copy) NSString *loc_name;//地区名

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
