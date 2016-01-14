//
//  DetailViewController.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/1.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailModel.h"
#import "SXYImageView.h"
#import "DetailNearByModel.h"
#import "SXYButton.h"
@interface DetailViewController ()<SXYImageViewDelegate>
{
    UIImageView *_headerImageView;
    UILabel *_nameLabel;
    UILabel *_detailLabel;
    UILabel *_categaryLabel;
    UILabel *_descriptionLabel;
    UIView *_imageViews;
    UIView *_footerView;
    DetailModel *_headerModel;
    NSMutableArray *_footerArray;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _footerArray=[NSMutableArray array];
    [self configUI];
    [self loadData];
}
-(void)configUI{
    [self addTitleView:@"应用详情"];
    [self addBarItem:@"返回" withBackgroundImage:@"buttonbar_back" withDirection:KLEFTNAVBAR];
    //空间的frame是相对于父视图的位置
    UIImageView *headerIV=[JLControl createImageViewWithFrame:CGRectMake(10, 64+10, 301, 284) withImageName:@"appdetail_background.png"];
    [self.view addSubview:headerIV];
    _headerImageView=[JLControl createImageViewWithFrame:CGRectMake(10, 20, 60, 60) withImageName:@"appproduct_appdefault.png"];
    _headerImageView.layer.cornerRadius=5;
    _headerImageView.layer.masksToBounds=YES;
    [headerIV addSubview:_headerImageView];
    
    _nameLabel=[JLControl createLabelWithFrame:CGRectMake(80, 8, 300-80-10, 18) withText:@"" withFontSize:15 withTextColor:[UIColor blackColor]];
    [headerIV addSubview:_nameLabel];
    
    _detailLabel=[JLControl createLabelWithFrame:CGRectMake(80, 28, 300-80-10, 18) withText:@"" ];
    [headerIV addSubview:_detailLabel];
    
    _categaryLabel=[JLControl createLabelWithFrame:CGRectMake(80, 48, 300-80-10, 18) withText:@""];
    [headerIV addSubview:_categaryLabel];
    NSArray *name=@[@"分享",@"收藏",@"下载"];
    for (NSInteger i=0; i<name.count; i++) {
        UIButton *btn=[JLControl createButtonWithFrame:CGRectMake(0+100*i,90 , 100, 40) withTitle:name[i] withTarget:self withAction:@selector(btnClick:)];
        btn.tag=100+i;
        [headerIV addSubview:btn];
    }
    _imageViews=[[UIView alloc]initWithFrame:CGRectMake(10, 140, 300-20, 70)];
    [headerIV addSubview:_imageViews];
    
    _descriptionLabel=[JLControl createLabelWithFrame:CGRectMake(10, 220, 300-20, 60) withText:@"" withIsLineBreak:YES];
    [headerIV addSubview:_descriptionLabel];
    headerIV.userInteractionEnabled=YES;
    
    _footerView=[[UIView alloc]initWithFrame:CGRectMake(10, 64+10+284+10, 300, 70)];
    [self.view addSubview:_footerView];
    UIImageView *imageView=[JLControl createImageViewWithFrame:CGRectMake(0, 0, 300, 103) withImageName:@"appdetail_recommend"];
    [_footerView addSubview:imageView];
}
-(void)leftClick:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnClick:(UIButton *)btn{
    if (btn.tag==100) {
        //点击分享按钮
    }else if (btn.tag==101){
        //点击收藏按钮
        if ([btn.titleLabel.text isEqualToString:@"收藏"]) {
            [btn setTitle:@"取消收藏" forState:UIControlStateNormal];
            
        }else if ([btn.titleLabel.text isEqualToString:@"取消收藏"]){
            [btn setTitle:@"收藏" forState:UIControlStateNormal];
        }
        
    }else if (btn.tag==102){
        //点击下载按钮
    }
}
-(void)loadData{
    NSString *appUrlString=[NSString stringWithFormat:kDetailUrl,_appId];
    HTTPManager *manager=[HTTPManager shareManager];
    [manager requestWithUrlString:appUrlString parameters:nil successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"详情界面数据：%@",responseObject);
        _headerModel=[[DetailModel alloc]initWithDictionary:responseObject error:nil];
        NSLog(@"######%@",_headerModel.descriptions);
        [self fillDataHeader];
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
    NSString *nearUrl=[NSString stringWithFormat:kNearByUrl];
    HTTPManager *nearManager=[HTTPManager shareManager];
    [nearManager requestWithUrlString:nearUrl parameters:nil successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"~~~%@",responseObject);
        NSArray *array=responseObject[@"applications"];
        for (NSDictionary *dic in array) {
            DetailNearByModel *model=[[DetailNearByModel alloc]initWithDictionary:dic error:nil];
            NSLog(@"~~~~~~~~~~~~%@",model);
            [_footerArray addObject:model];
        }
        
        [self fillDataFooter];
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"附近的人还在用数据请求错误：%@",error.localizedDescription);
    }];
}
//填充头部数据
-(void)fillDataHeader{
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:_headerModel.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault.png"]];
    _nameLabel.text=_headerModel.name;
    NSString *str=[NSString stringWithFormat:@"原价：%@  %@  %@MB",_headerModel.lastPrice,_headerModel.priceTrend,_headerModel.fileSize];
    _detailLabel.text=str;
    _descriptionLabel.text=_headerModel.descriptions
    ;
    _categaryLabel.text=[NSString stringWithFormat:@"类型：%@  评：%@分",_headerModel.categoryName,_headerModel.starCurrent];
    for (NSInteger i=0; i<_headerModel.photos.count; i++) {
        SXYImageView *imageView=[[SXYImageView alloc]initWithFrame:CGRectMake(0+(48+10)*i,0, 48, 70) withTag:444+i withDelegate:self];
        imageView.imageUrl=[_headerModel.photos[i] smallUrl];
        [_imageViews addSubview:imageView];
    }
}
//填充底部数据
-(void)fillDataFooter{
    for (NSInteger i=0; i<_footerArray.count&&i<4; i++) {
        SXYButton *btn=[[SXYButton alloc]initWithFrame:CGRectMake(10+(60+10)*i, 20, 60, 80) withTag:555+i withBlock:^(NSInteger tag) {
            NSLog(@"%ld",tag);
            DetailViewController *detail=[[DetailViewController alloc]init];
            DetailModel *model=[[DetailModel alloc]init];
            detail.appId=model.applicationId;
            [self.navigationController pushViewController:detail animated:YES];
        }];
        DetailNearByModel *model=_footerArray[i];
        [btn.imageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl]];
        btn.label.text=model.name;
        [_footerView addSubview:btn];
    }
    
}
#pragma mark SXYImageView代理
-(void)sendTag:(NSInteger)tag{
    NSLog(@"%ld",tag);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
