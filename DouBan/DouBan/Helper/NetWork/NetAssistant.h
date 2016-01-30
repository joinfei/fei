//
//  NetAssistant.h
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^SuccessRequest)(NSURLResponse *response, id responseObject, NSError *error);

@interface NetAssistant : NSObject

- (void)getRequestWithURL:(NSString *)url success:(SuccessRequest)success;

@end
