//
//  SXYSearchbar.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/1.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SXYSearchBarDelegate <NSObject>

-(void)sendKey:(NSString *)key;

@end
@interface SXYSearchbar : UIView<UISearchBarDelegate>
@property(nonatomic,weak)id<SXYSearchBarDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame withPlaceholder:(NSString *)placeholder withDelegate:(id<SXYSearchBarDelegate>)delegate;
-(void)showInView:(UIView *)view;
@end
