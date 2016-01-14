//
//  SmallCell.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
@interface SmallCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *appimageView;
@property (weak, nonatomic) IBOutlet UILabel *appNamaLabel;
@property (weak, nonatomic) IBOutlet StarView *appSmallStar;
@property (weak, nonatomic) IBOutlet UILabel *appCollectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *appDownloadLabel;

@end
