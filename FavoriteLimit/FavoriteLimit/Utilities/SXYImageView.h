//
//  SXYImageView.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/2.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SXYImageViewDelegate <NSObject>

-(void)sendTag:(NSInteger)tag;

@end
@interface SXYImageView : UIView
-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withDelegate:(id<SXYImageViewDelegate>)delegate;
@property(nonatomic,copy) NSString *imageUrl;

@end
