//
//  SXYButton.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/2.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "SXYButton.h"

@implementation SXYButton
{
    SXYButtonBlock _block;
}
-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withBlock:(SXYButtonBlock)block
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 60, 80)];
    if (self) {
        [self customView];
        self.tag=tag;
        _block=block;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
-(void)tapClick:(UITapGestureRecognizer *)tap{
    if (_block) {
        _block(self.tag);
    }
}
-(void)customView{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50,50)];
    _imageView=imageView;
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    imageView.layer.cornerRadius=5;
    imageView.layer.masksToBounds=YES;
    [self addSubview:_imageView];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(5,58, 50, 20)];
    label.font=[UIFont systemFontOfSize:12];
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor grayColor];
    _label=label;
    [self addSubview:_label];
}
@end
