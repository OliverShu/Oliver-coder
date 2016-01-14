//
//  SetModel.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "JSONModel.h"

@interface SetModel : JSONModel
@property(nonatomic,copy) NSString<Optional> *name;
@property(nonatomic,copy) NSString<Optional> *imageUrl;
@end
