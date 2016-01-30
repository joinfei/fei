//
//  Movie.h
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSString *image;//图片网址

@property (nonatomic, copy) NSString *movieID;//唯一标识

#warning unfinished

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
