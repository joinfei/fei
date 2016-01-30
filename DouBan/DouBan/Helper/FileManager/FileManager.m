//
//  FileManager.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager
static FileManager *manager = nil;
//单例方法
+ (FileManager *)shareManager{
@synchronized(self){
    if (!manager) {
        manager = [[FileManager alloc] init];
        
    }
  }
    return manager;
}

//图片缓存
//Caches 路径
- (NSString *)cachesPath{
    return
    [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
}
//Download 路径
- (NSString *)downloadImagePath{
    NSString *downloadPath = [[self cachesPath] stringByAppendingPathComponent:@"Download"];
    //判断该文件是否存在
   BOOL isExist = [NSFileManager defaultManager];
    //如果不存在 则创建
    if (!isExist) {
     BOOL isCreat =  [[NSFileManager defaultManager] createDirectoryAtPath:downloadPath withIntermediateDirectories:YES attributes:nil error:nil] ;
        NSLog(@"%@",isCreat ? @"成功":@"失败");
    }
    return downloadPath;
}
//图片的路径
- (NSString *)imageFilePathWithName:(NSString *)imageName{
    NSString *localImageName = [imageName stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return [[self downloadImagePath] stringByAppendingPathComponent:localImageName];
    
}

//清除缓存
+ (void)clearCaches{
    //移除文件夹
    [[NSFileManager defaultManager] removeItemAtPath:[manager downloadImagePath] error:nil];
    //新建一个新的文件夹
    [manager downloadImagePath];
}


@end
