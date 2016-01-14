//
//  SmallTableView.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "SmallTableView.h"
#import "SubjectModel.h"
#import "SmallCell.h"
#import "UIImageView+WebCache.h"
@implementation SmallTableView
{
    UITableView *_tableView;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customView];
    }
    return self;
}
-(void)setDataArray:(NSArray *)dataArray{
    _dataArray=dataArray;
    [_tableView reloadData];
}
-(void)customView{
    self.backgroundColor=[UIColor clearColor];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 212) style:UITableViewStylePlain];
    _tableView.backgroundColor=[UIColor clearColor];
    _tableView.bounces=NO;
    //设置分割线的颜色
    _tableView.separatorColor=[UIColor whiteColor];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"SmallCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self addSubview:_tableView];
}
#pragma mark UITableView代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 53;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIDE=@"cell";
    SmallCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIDE forIndexPath:indexPath];
    applicationModel *model=_dataArray[indexPath.row];
    [cell.appimageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    cell.appNamaLabel.text=model.name;
    cell.backgroundColor=[UIColor clearColor];
    cell.appCollectionLabel.text=model.ratingOverall;
    cell.appDownloadLabel.text=model.downloads ;
    [cell.appSmallStar setStarWithRate:[model.starOverall floatValue]/5.0];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    applicationModel *model=_dataArray[indexPath.row];
    if (_block) {
        _block(model.applicationId);
    }
    
    
}
@end
