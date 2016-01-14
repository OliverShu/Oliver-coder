//
//  SXYSearchbar.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/1.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "SXYSearchbar.h"
#import "Define.h"
@implementation SXYSearchbar
{
    UISearchBar *_searchBar;
    NSString *_placeholder;
    __weak id<SXYSearchBarDelegate> _delegate;
    UIView *_bgView;
}

- (instancetype)initWithFrame:(CGRect)frame withPlaceholder:(NSString *)placeholder withDelegate:(id<SXYSearchBarDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        _delegate=delegate;
        _placeholder=placeholder;
        [self configView];
        
    }
    return self;
}
-(void)configView{
    _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, 40)];
    _searchBar.placeholder=_placeholder;
    _searchBar.barStyle=UIBarStyleDefault;
    _searchBar.delegate=self;
    [self addSubview:_searchBar];
}
-(void)showInView:(UIView *)view{
    if (!_bgView) {
        _bgView=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    }
    
    _bgView.backgroundColor=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6];
    _bgView.hidden=YES;
    [view addSubview:_bgView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [_bgView addGestureRecognizer:tap];
    [view addSubview:self];
}
-(void)tapClick{
//    if (_delegate&&[_delegate respondsToSelector:@selector(sendKey:)]) {
//        [_delegate sendKey:_searchBar.text];
//    }
    [_searchBar resignFirstResponder];
}
#pragma mark UISearchBar的代理
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    _bgView.hidden=NO;
    [_searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    _bgView.hidden=YES;
    _searchBar.text=nil;
    
    [_searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if (_searchBar&&[_delegate respondsToSelector:@selector(sendKey:)]) {
        [_delegate sendKey:_searchBar.text];
    }
    
    [_searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    
}

@end
