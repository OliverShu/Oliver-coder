//
//  SmallTableView.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^smallTbBlock)(NSString *appId);
@interface SmallTableView : UIView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,copy) NSArray *dataArray;
@property(nonatomic,copy) smallTbBlock block;
@end
