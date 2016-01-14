//
//  DetailNearByModel.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/2.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "JSONModel.h"

@interface DetailNearByModel : JSONModel
@property(nonatomic,copy) NSString<Optional> *name;
@property(nonatomic,copy) NSString<Optional> *applicationId;
@property(nonatomic,copy) NSString<Optional> *iconUrl;
@end
