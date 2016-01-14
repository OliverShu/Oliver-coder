//
//  LimitViewController.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "LimitViewController.h"
#import "LimitCell.h"
#import "LimitModel.h"
#import "DetailViewController.h"
#import "HotViewController.h"
#import "SetViewController.h"
@interface LimitViewController ()<SXYSearchBarDelegate>

@end

@implementation LimitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)configUI{
    [super configUI];
    [self addSearchBarWithPlaceholder:@"60万款应用搜索框" withVC:self];
//    [self loadData];
    [self addMJRefreshIsHavingHeader:YES withIsHavingFooter:YES];
    [self addBarItem:@"分类" withBackgroundImage:@"buttonbar_action" withDirection:KLEFTNAVBAR];
    [self addBarItem:@"设置" withBackgroundImage:@"buttonbar_action" withDirection:KRIGHTNAVBAR];
    [self addTitleView:self.title];
    
    [_tableView registerNib:[UINib nibWithNibName:@"LimitCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    //separatorStyle设置分割线的样式
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}
-(void)leftClick:(UIButton *)btn{
    HotViewController *hot=[[HotViewController alloc]init];
//    hot.type=_type;
    [hot setValue:_type forKey:@"type"];
    [self.navigationController pushViewController:hot animated:YES];
}
-(void)rightClick:(UIButton *)btn{
    SetViewController *set=[[SetViewController alloc]init];
    [self.navigationController pushViewController: set animated:YES];
}
#pragma mark 刷新
-(void)reloadData{
    _currentPage=1;
    [self loadData];
}
-(void)loadMore{
    _currentPage++;
    [self loadData];
}
-(void)loadData{
    NSString *str;
    if ([_type isEqualToString:@"0"]) {
        str=kLimitUrl;
    }
    else if ([_type isEqualToString:@"1"]){
        str=kReduceUrl;
    }else if ([_type isEqualToString:@"2"]){
        str=kFreeUrl;
    }else if ([_type isEqualToString:@"4"]){
        str=kRankUrl;
    }else{
        return;
    }
    NSString *urlString=[NSString stringWithFormat:str,_currentPage];
    NSLog(@"urlString:%@",urlString);
    HTTPManager *manager=[HTTPManager shareManager];
    [manager requestWithUrlString:urlString parameters:nil successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        [_tableView.header endRefreshing];
        [_tableView.footer endRefreshing];
        if (_currentPage==1) {
            [_dataArray removeAllObjects];
        }
//        NSLog(@"%@",responseObject);
        NSArray *applications=responseObject[@"applications"];
        for (NSDictionary *dic in applications) {
            LimitModel *model=[[LimitModel alloc]initWithDictionary:dic error:nil];
            [_dataArray addObject:model];
        }
        [_tableView reloadData];
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        [_tableView.header endRefreshing];
        [_tableView.footer endRefreshing];
    }];
}
#pragma mark UITableView代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIDE=@"cell";
    LimitCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIDE forIndexPath:indexPath];
    LimitModel *model=_dataArray[indexPath.row];
    //参1 图片的网址 参2 默认图
    [cell.appHeaderImageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault.png"]];
    cell.appNameLabel.text=model.name;
    cell.appPriceLabel.text=[NSString stringWithFormat:@"¥%@",model.lastPrice];
    cell.appPriceLabel.lineType=LineTypeMiddle;
    if ([_type isEqualToString:@"2"]) {
        cell.appPriceLabel.lineType=LineTypeNone;
    }
    
//    cell.appPriceLabel.lineColor=KLINECOLOR;
    [cell.appStarView setStarWithRate:[model.starCurrent floatValue]/5.0];
    cell.appTypeLabel.text=model.categaryName;
    cell.appDetailLabel.text=[NSString stringWithFormat:@"分享：%@次  收藏：%@次  下载：%@次",model.shares,model.favorites,model.downloads];
    cell.appTimeLabel.text=model.expireDateTime;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detail=[[DetailViewController alloc]init];
    detail.hidesBottomBarWhenPushed=YES;
    LimitModel *model=_dataArray[indexPath.row];
    detail.appId=model.applicationId;
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark SXYSearchBar代理
-(void)sendKey:(NSString *)key{
    NSLog(@"%@",key);
    //将字符串转换成UNicode编码格式，在请求数据的时候，URL的网址不能有中文，可以用这个方法转换
    NSString *str=[key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"str:%@",str);
    //将上面的格式转换成中文
    NSString *str2=[str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"str2:%@",str2);
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
