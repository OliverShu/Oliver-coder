//
//  DetailModel.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/2.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "JSONModel.h"

@protocol PhotoModel <NSObject>
@end
@interface PhotoModel : JSONModel
@property(nonatomic,copy) NSString<Optional> *originalUrl;
@property(nonatomic,copy) NSString<Optional> *smallUrl;
@end





@interface DetailModel : JSONModel
@property(nonatomic,copy) NSString<Optional> *applicationId;
@property(nonatomic,copy) NSString<Optional> *categoryName;
 @property(nonatomic,copy) NSString<Optional> *fileSize;
@property(nonatomic,copy) NSString<Optional> *iconUrl;
@property(nonatomic,copy) NSString<Optional> *itunesUrl;
@property(nonatomic,copy) NSString<Optional> *descriptions;
@property(nonatomic,copy) NSString<Optional> *lastPrice;
@property(nonatomic,copy) NSString<Optional> *name;
@property(nonatomic,copy) NSString<Optional> *priceTrend;
@property(nonatomic,copy) NSString<Optional> *starCurrent;
@property(nonatomic,copy) NSArray <PhotoModel>*photos;
@end
