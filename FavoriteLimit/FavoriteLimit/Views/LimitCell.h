//
//  LimitCell.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFLineLabel.h"
#import "StarView.h"

@interface LimitCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *appHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *appTimeLabel;
@property (weak, nonatomic) IBOutlet QFLineLabel *appPriceLabel;
@property (weak, nonatomic) IBOutlet StarView *appStarView;
@property (weak, nonatomic) IBOutlet UILabel *appTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *appDetailLabel;

@end
