//
//  LimitModel.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "LimitModel.h"

@implementation LimitModel
#if 1
-(NSString<Optional> *)expireDateTime{
    //拿到当前时间
    NSDate *date=[NSDate date];
    //
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.S"];
    NSDate *date1=[formatter dateFromString:_expireDateTime];
    //时间差
    NSTimeInterval time=[date1 timeIntervalSinceDate:date];
    
    _expireDateTime=[NSString stringWithFormat:@"%02ld:%02ld:%02ld",(NSInteger)time/3600,((NSInteger)time/60)%60,(NSInteger)time%60];
    return _expireDateTime;
}
#endif
-(NSString<Optional> *)expireDatetime{
    NSLog(@"%@",_expireDateTime);
    NSDate *date=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.S"];
    NSDate *date1=[formatter dateFromString:_expireDateTime];
    NSTimeInterval time=[date1 timeIntervalSinceDate:date];
    NSString *str=[NSString stringWithFormat:@"%02ld:%02ld:%02ld",(NSInteger)time/3600,((NSInteger)time/60)%60,(NSInteger)time%60];
    return str;
}
-(void)setApplicationId:(NSString<Optional> *)applicationId{
    
}
@end
