//
//  UIImageView+Addition.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "UIImageView+Addition.h"
#import "ImageDownloader.h"

@implementation UIImageView (Addition)

- (void)setImageWithImageURL:(NSString *)imageURL placeholder:(UIImage *)placeholder {
    //占位图
    self.image = placeholder;
    //请求图片
    ImageDownloader *downloader = [[ImageDownloader alloc] initWithImageURL:imageURL];
    downloader.imageDownloadBlock = ^(NSData *data) {
        self.image = [UIImage imageWithData:data];
    };
    //开始下载
    [downloader startDownload];
    [downloader release];
}






@end
