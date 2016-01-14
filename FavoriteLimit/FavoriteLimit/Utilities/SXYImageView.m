//
//  SXYImageView.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/2.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "SXYImageView.h"
#import "UIImageView+WebCache.h"
@implementation SXYImageView
{
    UIImageView *_imageView;
    __weak id<SXYImageViewDelegate>_delegate;
}
-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withDelegate:(id<SXYImageViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        _delegate=delegate;
        self.tag=tag;
        [self configView];
    }
    return self;
}
-(void)configView{
    _imageView=[[UIImageView alloc]initWithFrame:self.bounds];
    _imageView.contentMode=UIViewContentModeScaleToFill;
    [self addSubview:_imageView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [self addGestureRecognizer:tap];
    
}
-(void)setImageUrl:(NSString *)imageUrl{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    _imageUrl=imageUrl;
}
-(void)tapClick:(UITapGestureRecognizer *)tap{
    if (_delegate&&[_delegate respondsToSelector:@selector(sendTag:)]) {
        [_delegate sendTag:self.tag];
    }
}
@end
