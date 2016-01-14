//
//  HotModel.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "JSONModel.h"

@interface HotModel : JSONModel
@property(nonatomic,copy) NSString<Optional> *categoryId;
@property(nonatomic,copy) NSString<Optional> *categoryName;
@property(nonatomic,copy) NSString<Optional> *count;
@property(nonatomic,copy) NSString<Optional> *lessenPrice;
@end
