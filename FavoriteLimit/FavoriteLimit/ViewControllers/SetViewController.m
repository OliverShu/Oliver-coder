//
//  SetViewController.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "SetViewController.h"
#import "SetModel.h"
#import "SetCell.h"
#import "SetDetailViewController.h"
@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
}
-(void)loadData{
    [_collectionView reloadData];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"SetList" ofType:@"plist"];
    NSArray *arr=[NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in arr) {
        SetModel *model=[[SetModel alloc]initWithDictionary:dic error:nil];
        [_dataArray addObject:model];
    }
    [_collectionView reloadData];
}
-(void)configUI{
    [super configUI];
    [self addBarItem:@"返回" withBackgroundImage:@"buttonbar_back" withDirection:KLEFTNAVBAR];
    [self addTitleView:@"设置详情"];
    [_collectionView registerNib:[UINib nibWithNibName:@"SetCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
}
-(void)leftClick:(UIButton *)btn{
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark UICollectionView 代理
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(60, 80);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(30, 30, 30, 30);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *itemIDE=@"cell";
    SetCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:itemIDE forIndexPath:indexPath];
    SetModel *model=_dataArray[indexPath.row];
    cell.itemImage.image=[UIImage imageNamed:model.imageUrl];
    cell.itemName.text=model.name;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SetDetailViewController *setDetail=[[SetDetailViewController alloc]init];
    [self.navigationController pushViewController:setDetail animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
