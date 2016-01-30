//
//  FileManager.h
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

//单例方法
+ (FileManager *)shareManager;


//图片缓存
//Caches 路径
- (NSString *)cachesPath;
//Download 路径
- (NSString *)downloadImagePath;
//图片的路径
- (NSString *)imageFilePathWithName:(NSString *)imageName;


//清除缓存
+ (void)clearCaches;

@end
