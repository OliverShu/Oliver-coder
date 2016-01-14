//
//  SubjectViewController.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "SubjectViewController.h"
#import "SubjectModel.h"
#import "SujectCell.h"
#import "DetailViewController.h"
@interface SubjectViewController ()

@end

@implementation SubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)configUI{
    [super configUI];
    [self addTitleView:@"专题"];
    [self addMJRefreshIsHavingHeader:YES withIsHavingFooter:YES];
    [_tableView registerNib:[UINib nibWithNibName:@"SujectCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
#pragma mark 加载数据
-(void)loadMore{
    _currentPage++;
    [self loadData];
}
-(void)reloadData{
    _currentPage=1;
    [self loadData];
}
-(void)loadData{
    NSString *urlString=[NSString stringWithFormat:kSubjectUrl,_currentPage];
    [[HTTPManager shareManager] requestWithUrlString:urlString parameters:nil successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array=(NSArray *)responseObject;
        [_tableView.header endRefreshing];
        [_tableView.footer endRefreshing];
        if (_currentPage==1) {
            [_dataArray removeAllObjects];
        }
        for (NSDictionary *dic in array) {
            SubjectModel *model=[[SubjectModel alloc]initWithDictionary:dic error:nil];
            [_dataArray addObject:model];
        }
        [_tableView reloadData];
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        [_tableView.header endRefreshing];
        [_tableView.footer endRefreshing];
        NSLog(@"%@",error.localizedDescription);
    }];
}
#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 313;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIDE=@"cell";
    SujectCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIDE forIndexPath:indexPath];
    SubjectModel *model=_dataArray[indexPath.row];
    cell.categoryName.text=model.title;
    [cell.categoryImage sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    [cell.girlHeader sd_setImageWithURL:[NSURL URLWithString:model.desc_img]placeholderImage:[UIImage imageNamed:@"topic_Header"]];
    cell.girlSay.text=model.desc;
    cell.categoryApps.dataArray=model.applications;
     if (!cell.categoryApps.block) {
         KWS(ws);
         cell.categoryApps.block=^(NSString *appId){
            DetailViewController *detail=[[DetailViewController alloc]init];
            detail.appId=appId;
            [ws.navigationController pushViewController:detail animated:YES];
        };
    };
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
