//
//  ListViewController.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "RootViewController.h"
#import "MJRefresh.h"
#import "SXYSearchbar.h"
@interface ListViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSInteger _currentPage;//记录当前页
    //type @"0" 代表限免 @"1" 代表免费 @"2" 代表 @"4" 代表热榜
    NSString *_type;
}
-(void)configUI;
-(void)loadData;
//是否拥有上下拉刷新
-(void)addMJRefreshIsHavingHeader:(BOOL)isHavingHeader withIsHavingFooter:(BOOL)isHavingFooter;
-(void)loadMore;
-(void)reloadData;
//添加searchBar
-(void)addSearchBarWithPlaceholder:(NSString *)placeholder withVC:(UIViewController<SXYSearchBarDelegate>*)vc;//

@end
