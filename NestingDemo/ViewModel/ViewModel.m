//
//  ViewModel.m
//  NestingDemo
//
//  Created by rp.wang on 16/3/3.
//  Copyright © 2016年 rp.wang. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

+(void)getGuestData :(NSDictionary *)PostData secuessBlock:(void(^)(NSArray *FeedList))FeedbackData  ErrCode:(void(^)(id ErrCode))ErrorCode {
    NSString *handleUrl  = @"https://itunes.apple.com/search";
    handleUrl = [handleUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:handleUrl parameters:PostData progress:^(NSProgress *Noll){
        
    } success:^(NSURLSessionDataTask *task, id responseObject){
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *resulte = [NSArray array];
        resulte = [HomeModel mj_objectArrayWithKeyValuesArray:data[@"results"]];
        if(FeedbackData)
        {
            FeedbackData(resulte);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        //失败
        if(ErrorCode)
        {
            ErrorCode(error);
        }
    }];
}


@end
