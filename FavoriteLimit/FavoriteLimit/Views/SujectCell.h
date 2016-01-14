//
//  SujectCell.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallTableView.h"
@interface SujectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryName;
@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;
@property (weak, nonatomic) IBOutlet SmallTableView *categoryApps;
@property (weak, nonatomic) IBOutlet UIImageView *girlHeader;
@property (weak, nonatomic) IBOutlet UILabel *girlSay;

@end
