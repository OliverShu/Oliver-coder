//
//  RootViewController.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
#import "HTTPManager.h"
#import "UIImageView+WebCache.h"
#import "JLControl.h"
@interface RootViewController : UIViewController
//添加titleView
-(void)addTitleView:(NSString *)name;
//第一个问题，下面的方法的写法，还有好处
//添加左右按钮
-(void)addBarItem:(NSString *)title withBackgroundImage:(NSString *)backgroundImage withDirection:(NSString *)direction;
-(void)leftClick:(UIButton *)btn;
-(void)rightClick:(UIButton *)btn;

//-(void)addBarItem:(NSString *)title withImage:(NSString *)imageName withBackgroundImage:(NSString *)backgroundImage withDirection:(NSString *)direction;




@end
