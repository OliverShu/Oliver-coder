//
//  FormViewController.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray=[NSMutableArray array];
    [self configUI];
}
-(void)configUI{
    self.automaticallyAdjustsScrollViewInsets=NO;
    NSLog(@"子类需要重写configUI，且需要调用父类的configUI");
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing=30;
    flowLayout.minimumInteritemSpacing=20;
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, KSCREENWIDTH, KSCREENHEIGHT-64-49) collectionViewLayout:flowLayout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_collectionView];
}
-(void)loadData{
    NSLog(@"子类需要重写loadData");
}
#pragma mark UICollectionView的代理
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"子类需要重写collectionView numberOfItemsInSection:");
    return 0;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"子类需要重写sizeForItemAtIndexPath:");
    return CGSizeMake(0, 0);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    NSLog(@"子类需要重写insetForSectionAtIndex:");
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"子类需要重写cellForItemAtIndexPath:");
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
