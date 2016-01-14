//
//  HotViewController.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "HotViewController.h"
#import "HotCell.h"
#import "HotModel.h"
@interface HotViewController ()

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
-(void)configUI{
    
    [super configUI];
    [self addBarItem:@"返回" withBackgroundImage:@"buttonbar_back" withDirection:KLEFTNAVBAR];
    [self addTitleView:@"热榜分类"];
    [_tableView registerNib:[UINib nibWithNibName:@"HotCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self loadData];
//    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
//    [btn setBackgroundColor:[UIColor blackColor]];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    btn.layer.cornerRadius=50;
//    btn.layer.masksToBounds=NO;
//    
//    [self.view addSubview:btn];
//    UIImageView *view=[[UIImageView alloc]initWithFrame:CGRectMake(100, 250, 100, 100)];
//    view.backgroundColor=[UIColor blueColor];
//    view.userInteractionEnabled=YES;
//    view.layer.cornerRadius=50;
//    view.layer.masksToBounds=YES;
//    
//    [self.view addSubview:view];
}
-(void)btnClick:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadData{
    NSString *urlString;
    if ([_type isEqualToString:@"0"]) {
        urlString=kCategoryLimitUrl;
    }else if ([_type isEqualToString:@"1"]){
        urlString=kCategoryReduceUrl;
    }else if ([_type isEqualToString:@"2"]){
        urlString=kCategoryFreeUrl;
    }else if ([_type isEqualToString:@"4"]){
        urlString=kCategoryRankUrl;
    }else{
        return;
    }
    [[HTTPManager shareManager] requestWithUrlString:urlString parameters:nil successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"CategoryresponseObject:%@",responseObject);
        NSArray *array=responseObject[@"category"];
        for (NSDictionary *dic in array) {
            HotModel *model=[[HotModel alloc]initWithDictionary:dic error:nil];
            [_dataArray addObject:model];
        }
        [_tableView reloadData];
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"热榜分类数据请求错误%@",error.localizedDescription);
    }];
}
-(void)leftClick:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark UItableView代理
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 87;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIDE=@"cell";
    HotCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIDE forIndexPath:indexPath];
    HotModel *model=_dataArray[indexPath.row];
    UIImage *image=[UIImage imageNamed:[NSString
    stringWithFormat:@"category_%@.jpg",model.categoryName]];
    if (!image) {
            image=[UIImage imageNamed:@"category_All"];
        }
    cell.appImage.image=image;
    cell.appName.text=model.categoryName;
    
    cell.appDetail.text=[NSString stringWithFormat:@"共 %@ 款应用，其中降价 %@ 应用",model.count,model.lessenPrice];
    return cell;
}
//-(void)configUI{
//    [super configUI];
//    [self loadData];
//    
//    [self addTitleView:@"热榜分类"];
//    [self addBarItem:@"返回" withBackgroundImage:@"buttonbar_back" withDirection:KLEFTNAVBAR];
//    [_tableView registerNib:[UINib nibWithNibName:@"HotCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//}
//-(void)loadData{
//    NSString *urlString;
//    if ([_type isEqualToString:@"0"]) {
//        urlString=kCategoryLimitUrl;
//    }
//    else if ([_type isEqualToString:@"1"]){
//        urlString=kCategoryReduceUrl;
//    }else if ([_type isEqualToString:@"2"]){
//        urlString=kCategoryFreeUrl;
//    }else if ([_type isEqualToString:@"4"]){
//        urlString=kCategoryRankUrl;
//    }else{
//        return;
//    }
//    
//    HTTPManager *manager=[HTTPManager shareManager];
//    [manager requestWithUrlString:urlString parameters:nil successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"hot:%@",responseObject);
//        NSArray *array=responseObject[@"category"];
//        NSLog(@"array%@",array);
//        for (NSDictionary *dic in array) {
//            HotModel *model=[[HotModel alloc]initWithDictionary:dic error:nil];
//            [_dataArray addObject:model];
//            
//            NSLog(@"_dataArray:%@",_dataArray);
//        }
//        [_tableView reloadData];
//    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
//}
//-(void)leftClick:(UIButton *)btn{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 87;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString * cellIDE=@"cell";
//    HotCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIDE forIndexPath:indexPath];
//    UIView *view=[[UIView alloc]init];
//    view.backgroundColor=[UIColor yellowColor];
//    //设置cell选中时的背景图
//    cell.selectedBackgroundView=view;
//    cell.selectionStyle=UITableViewCellSelectionStyleBlue;
//    HotModel *model=_dataArray[indexPath.row];
//    NSLog(@"model%@",model);
////    cell.appImage sd_setImageWithURL:[NSURL URLWithString:model.]
//    UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"category_%@",model.categoryName]];
//    if (!image) {
//        image=[UIImage imageNamed:@"category_All"];
//    }
//    cell.appImage.image=image;
//    cell.appName.text=model.categoryName;
//    cell.appDetail.text=[NSString stringWithFormat:@"共 %@ 款应用，其中降价 %@ 应用",model.count,model.lessenPrice];
//    return cell;
//}
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
