//
//  SetCell.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "SetCell.h"

@implementation SetCell

- (void)awakeFromNib {
    // Initialization code
    _itemImage.layer.cornerRadius=5;
    _itemImage.layer.masksToBounds=YES;
}

@end
