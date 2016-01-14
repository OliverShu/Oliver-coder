//
//  FormViewController.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/12/3.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "RootViewController.h"

@interface FormViewController : RootViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
}
-(void)configUI;
-(void)loadData;
@end
