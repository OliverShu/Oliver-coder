//
//  RootViewController.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void)addTitleView:(NSString *)name{
//    NSArray *nameArray=@[];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150*KRATE, 44)];
    label.textColor=[UIColor blueColor];
    label.text=name;
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont boldSystemFontOfSize:22];
    self.navigationItem.titleView=label;
    
    
}
-(void)addBarItem:(NSString *)title withBackgroundImage:(NSString *)backgroundImage withDirection:(NSString *)direction{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44*KRATE, 30)];
    if (title!=nil) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:14];
    }
    if (backgroundImage!=nil) {
        [btn setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
        
    }
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]initWithCustomView:btn];
    if ([direction isEqualToString:KLEFTNAVBAR]) {
        
        [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem=barBtn;
    }else if ([direction isEqualToString:KRIGHTNAVBAR]){
    
        [btn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem=barBtn;
    }
    
    
}
-(void)leftClick:(UIButton *)btn{
    NSLog(@"子类需要重写leftClick:方法");
    
}
-(void)rightClick:(UIButton *)btn{
    NSLog(@"子类需要重写rightClick:方法");
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
