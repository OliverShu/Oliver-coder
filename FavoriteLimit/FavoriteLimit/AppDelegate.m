//
//  AppDelegate.m
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//

#import "AppDelegate.h"
#import "ListViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self createRoot];
    return YES;
}

-(void)createRoot{
    NSArray *vcName=@[@"LimitViewController",@"LimitViewController",@"LimitViewController",@"SubjectViewController",@"LimitViewController"];
    NSArray *contentArray=@[@{@"title":@"限免",@"tabBarImage":@"tabbar_limitfree"},@{@"title":@"降价",@"tabBarImage":@"tabbar_reduceprice"},@{@"title":@"免费",@"tabBarImage":@"tabbar_limitfree"},@{@"title":@"专题",@"tabBarImage":@"tabbar_subject"},@{@"title":@"热榜",@"tabBarImage":@"tabbar_rank"}];
    NSMutableArray *viewControllers=[NSMutableArray array];
    for (NSInteger i=0; i<vcName.count; i++) {
        Class class=NSClassFromString(vcName[i]);
        ListViewController *vc=[[class alloc]init];
        [vc setValue:[NSString stringWithFormat:@"%ld",i] forKey:@"type"];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        vc.title=contentArray[i][@"title"];
        nav.tabBarItem.image=[UIImage imageNamed:contentArray[i][@"tabBarImage"]];
        NSString *str=[contentArray[i][@"tabBarImage"] stringByAppendingString:@"_press.png"];
        nav.tabBarItem.selectedImage=[UIImage imageNamed:str];
        [viewControllers addObject:nav];
    }
    UITabBarController *tab=[[UITabBarController alloc]init];
    tab.viewControllers=viewControllers;
    self.window.rootViewController=tab;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
