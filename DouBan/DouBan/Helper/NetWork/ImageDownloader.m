//
//  ImageDownloader.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ImageDownloader.h"
#import "FileManager.h"
#import "DouBanURL.h"
#import "NetAssistant.h"
@implementation ImageDownloader

- (instancetype)initWithImageURL:(NSString *)imageURL {
    self = [super init];
    if (self) {
        self.imageURL = imageURL;
        
    }
    return self;
}

- (void)startDownload {
    //先判断本地是否缓存过该图片
    if ([self fileExist]) {
        //如果有，则直接把对应数据传递到外界
        [self loadFromlocal];
    } else {
        //如果本地没有，则请求网络下载 下载后保存到本地
        [self loadFromNetWork];
    }
}
//从本地读取
- (void)loadFromlocal {
    NSData *data = [NSData dataWithContentsOfFile:[[FileManager shareManager] imageFilePathWithName:self.imageURL]];
    //使用block传递出去
    self.imageDownloadBlock(data);
}
//从网络请求
- (void)loadFromNetWork {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.imageURL]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.imageDownloadBlock(data);
        //保存到本地
        NSString *filePath = [[FileManager shareManager] imageFilePathWithName:self.imageURL];
        //写入
        [data writeToFile:filePath atomically:YES];
    }];
    
}

- (BOOL)fileExist{
    return  [[NSFileManager defaultManager] fileExistsAtPath:[[FileManager shareManager] imageFilePathWithName:self.imageURL]];
    
}








////文件是否存在
//- (BOOL)fileExist {
//    NSFileManager *manager = [NSFileManager defaultManager];
//    return [manager fileExistsAtPath:[self localImagePath]];
//}

//- (NSString *)localImagePath {
//    NSString *imageName = [self.imageURL stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
//    return [[self imagePath] stringByAppendingPathComponent:imageName];
//}


/*
 可将以下3个方法合在一起写
 */
/*
//获取caches文件夹
- (NSString *)cachesFilePath {
    return  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

//获取存放图片的文件夹路径
- (NSString *)downloadImageFilePath {
    return [[self cachesFilePath] stringByAppendingPathComponent:@"images"];
}
//获取图片的路径
- (NSString *)imagePath {
    //文件管理类
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isExist = [manager fileExistsAtPath:[self downloadImageFilePath]];
    //如果不存在
    if (NO == isExist) {
        //则创建
        BOOL isSuccess = [manager createDirectoryAtPath:[self downloadImageFilePath] withIntermediateDirectories:YES attributes:nil error:nil];
        NSLog(@"%@", isSuccess ? @"成功创建":@"创建失败");
    }
    //如果存在
    return [self downloadImageFilePath];
}
*/

//获取 Caches-》images文件夹(存储图片)路径
- (NSString *)imagePath {
    //沙盒文件夹下 Caches 文件夹路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //images文件夹路径
    NSString *imagesFilePath = [cachesPath stringByAppendingPathComponent:@"images"];
    
    //文件管理类
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isExist = [manager fileExistsAtPath:imagesFilePath];
    //如果不存在
    if (NO == isExist) {
        //则创建
        BOOL isSuccess = [manager createDirectoryAtPath:imagesFilePath withIntermediateDirectories:YES attributes:nil error:nil];
        NSLog(@"%@", isSuccess ? @"成功创建":@"创建失败");
    }
    //如果存在
    return imagesFilePath;
}


@end
