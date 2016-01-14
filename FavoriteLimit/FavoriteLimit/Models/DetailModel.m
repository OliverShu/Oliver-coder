//
//  DetailModel.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/2.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"description":@"descriptions"}];
}
@end
@implementation PhotoModel

@end