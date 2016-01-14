//
//  ListViewController.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray=[NSMutableArray array];
    [self configUI];

}
-(void)configUI{
    NSLog(@"父类的configUI被调用了");
    self.automaticallyAdjustsScrollViewInsets=NO;
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, KSCREENWIDTH, KSCREENHEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
-(void)loadData{
    NSLog(@"子类需要重写loadData方法");
}
#pragma mark 下拉刷新，上拉加载更多
-(void)addMJRefreshIsHavingHeader:(BOOL)isHavingHeader withIsHavingFooter:(BOOL)isHavingFooter{
    if (isHavingFooter) {
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData)];
        //开始加载
        [_tableView.header beginRefreshing];
    }
    if (isHavingFooter) {
        _tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
//        [_tableView.footer beginRefreshing];
        
    }
}
-(void)reloadData{
    NSLog(@"子类需要重写reloadData:方法");
}
-(void)loadMore{
    NSLog(@"子类需要重写loadMore:方法");
}
#pragma mark 添加搜索栏
-(void)addSearchBarWithPlaceholder:(NSString *)placeholder withVC:(UIViewController<SXYSearchBarDelegate>*)vc{
    SXYSearchbar *searchBar=[[SXYSearchbar alloc]initWithFrame:CGRectMake(0, 64, KSCREENWIDTH, 44) withPlaceholder:placeholder withDelegate:vc];
//    [self.view addSubview:searchBar];
    [searchBar showInView:self.view];
    _tableView.frame=CGRectMake(0, 64+40, KSCREENWIDTH,KSCREENHEIGHT-64-49-40) ;
}
#pragma mark UITableView的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"子类需要重写numberOfRowsInSection:方法");
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"子类需要重写tableView cellForRowAtIndexPath:方法");
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
