//
//  HTTPManager.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "HTTPManager.h"

@implementation HTTPManager
+(HTTPManager *)shareManager{
    static HTTPManager *manager=nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (manager==nil) {
            manager=[[HTTPManager alloc]init];
        }
    });
    return manager;
}

-(void)requestWithUrlString:(NSString *)urlString parameters:(NSDictionary *)dic successBlock:(successBlock)sucBlock failureBlock:(failureBlock)flailBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
#warning 没有写请求的数据类型
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/text",@"text/html", nil];
    [manager GET:urlString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        sucBlock(operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"RequstError:%@",error.localizedDescription);
        flailBlock(operation,error);
    }];
    
}
-(void)cancelAllRequest{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];//这个不是单例
    //manager.operationQueue请求数据的队列,有且只有一个，所有请求的request操作都是放在这个队列中
    //manager.operationQueue.operationCount拿到队列中request操作的个数
    if (manager.operationQueue.operationCount>0) {
        //取消队列中所有的操作
        [manager.operationQueue cancelAllOperations];
    }
}
@end
