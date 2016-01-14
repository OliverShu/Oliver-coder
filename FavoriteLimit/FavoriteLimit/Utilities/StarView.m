//
//  StarView.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "StarView.h"

@implementation StarView
{
    UIImageView *_bgImageView;
    UIImageView *_starImageView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self configImageView];
    }
    return self;
}
//当把自定制的View放到xib上面的时候，当需要创建对象的时候，是调用解归档的方法
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configImageView];
    }
    return self;
}
-(void)configImageView{
    self.backgroundColor=[UIColor clearColor];
    _bgImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 23)];
    _bgImageView.image=[UIImage imageNamed:@"StarsBackground.png"];
    _bgImageView.contentMode=UIViewContentModeLeft;
    [self addSubview:_bgImageView];
    _starImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 23)];
    _starImageView.image=[UIImage imageNamed:@"StarsForeground"];
    //居左填充
    _starImageView.contentMode=UIViewContentModeLeft;
    _starImageView.clipsToBounds=YES;
    [self addSubview:_starImageView];
}
-(void)setStarWithRate:(float)rate{
    _starImageView.frame=CGRectMake(0, 0, 65*rate, 23);
}

@end
