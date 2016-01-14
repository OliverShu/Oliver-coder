//
//  SXYButton.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/2.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SXYButtonBlock)(NSInteger tag);
@interface SXYButton : UIView
@property(nonatomic,weak) UIImageView *imageView;
@property(nonatomic,weak) UILabel *label;

-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withBlock:(SXYButtonBlock)block;
@end
