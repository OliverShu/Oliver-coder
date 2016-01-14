//
//  HTTPManager.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^successBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void(^failureBlock)(AFHTTPRequestOperation *operation, NSError *error);
@interface HTTPManager : NSObject
+(HTTPManager *)shareManager;
-(void)requestWithUrlString:(NSString *)urlString parameters:(NSDictionary *)dic successBlock:(successBlock)sucBlock failureBlock:(failureBlock)flailBlock;
//取消所有请求
-(void)cancelAllRequest;
@end
