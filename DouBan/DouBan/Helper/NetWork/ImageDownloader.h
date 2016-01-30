//
//  ImageDownloader.h
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 图片异步缓存：
 先查找本地是否缓存过对应图片，如果存在，从本地读取，否则，请求网络，请求之后保存到本地
 */

typedef void(^DownloadBlock)(NSData *data);
@interface ImageDownloader : NSObject



@property (nonatomic, copy) NSString *imageURL;

//定义Block属性 语义特性须使用 copy 关键字
@property (nonatomic, copy) DownloadBlock imageDownloadBlock;

- (instancetype)initWithImageURL:(NSString *)imageURL;

//开始下载
- (void)startDownload;

@end
