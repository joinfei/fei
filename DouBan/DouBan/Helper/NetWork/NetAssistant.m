//
//  NetAssistant.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NetAssistant.h"

@implementation NetAssistant

- (void)getRequestWithURL:(NSString *)url success:(SuccessRequest)success {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       //JSON解析
        id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        success(response, object, connectionError);
        
    }];
    
    
    
    
}

@end
