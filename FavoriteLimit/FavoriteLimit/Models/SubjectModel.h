//
//  SubjectModel.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "JSONModel.h"

@protocol applicationModel

@end

@interface applicationModel : JSONModel
@property(nonatomic,copy) NSString<Optional> *applicationId;
@property(nonatomic,copy) NSString<Optional> *downloads;
@property(nonatomic,copy) NSString<Optional> *iconUrl;
@property(nonatomic,copy) NSString<Optional> *name;
@property(nonatomic,copy) NSString<Optional> *ratingOverall;
@property(nonatomic,copy) NSString<Optional> *starOverall;
@end

@interface SubjectModel : JSONModel
@property(nonatomic,copy) NSArray<applicationModel> *applications;
@property(nonatomic,copy) NSString<Optional> *date;
@property(nonatomic,copy) NSString<Optional> *desc;
@property(nonatomic,copy) NSString<Optional> *desc_img;
@property(nonatomic,copy) NSString<Optional> *img;
@property(nonatomic,copy) NSString<Optional> *title;
@end
