//
//  ReduceModel.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/1.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "JSONModel.h"

@interface ReduceModel : JSONModel
@property(nonatomic,copy) NSString<Optional> *applicationId;
@property(nonatomic,copy) NSString<Optional> *name;
@property(nonatomic,copy) NSString<Optional> *categaryName;
@property(nonatomic,copy) NSString<Optional> *downloads;
@property(nonatomic,copy) NSString<Optional> *expireDateTime;
@property(nonatomic,copy) NSString<Optional> *lastPrice;
@property(nonatomic,copy) NSString<Optional> *shares;
@property(nonatomic,copy) NSString<Optional> *starCurrent;
@property(nonatomic,copy) NSString<Optional> *iconUrl;
@property(nonatomic,copy) NSString<Optional> *favorites;
@end
