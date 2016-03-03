//
//  ViewModel.h
//  NestingDemo
//
//  Created by rp.wang on 16/3/3.
//  Copyright © 2016年 rp.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "HomeModel.h"
#import "MJExtension.h"

@interface ViewModel : NSObject

+(void)getGuestData :(NSDictionary *)PostData secuessBlock:(void(^)(NSArray *FeedList))FeedbackData  ErrCode:(void(^)(id ErrCode))ErrorCode;

@end
