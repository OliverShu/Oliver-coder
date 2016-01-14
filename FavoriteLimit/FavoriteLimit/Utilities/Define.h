//
//  Define.h
//  FavoriteLimit
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 舒晓仪. All rights reserved.
//宏定义要勤打括号

#pragma mark 配置相关
#define KLEFTNAVBAR (@"left_navbar_item")
#define KRIGHTNAVBAR (@"right_navbar_item")
#define KWS(weakSelf) __weak typeof (self) weakSelf=self;
#pragma mark 颜色相关

#define KCOLORP(r,g,b,p) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(p)*1.0]
#define KCOLOR(r,g,b) KCOLORP(r,g,b,1.0)

#define KTITLEVIEWCOLOR KCOLOR(40,146,226)

#define KLINECOLOR KCOLOR(158,158,159)

#pragma mark 屏幕尺寸相关
#define KSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define KSCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define KRATE KSCREENWIDTH/320.0

#pragma mark 请求的网址
//注意：1.每个网址都需要打注释 2.在开发中一般有两类网址，测试网址和上线网址，上线前一定要换好
//1.限免
#define kLimitUrl (@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%ld")

//2.降价
#define kReduceUrl (@"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%ld")


//3.免费
#define kFreeUrl (@"http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%ld")

//4.专题
//#define kSubjectUrl (@"http://iappfree.candou.com:8080/free/special?page=%ld&limit=5")
#define kSubjectUrl (@"http://1000phone.net:8088/app/iAppFree/api/topic.php?page=%ld&number=20")

//5.热榜
//#define kRankUrl (@"http://open.candou.com/mobile/hot/page/%ld")
#define kRankUrl (@"http://1000phone.net:8088/app/iAppFree/api/hot.php?page=%ld&number=20")


//搜索
#define kLimitSearchUrl (@"http://1000phone.net:8088/app/iAppFree/api/limited.php?page=%ld&number=20&search=%@")

#define KReduceSearchUrl (@"http://1000phone.net:8088/app/iAppFree/api/reduce.php?page=%ld&number=20&search=%@")

#define kFreeSearchUrl (@"http://1000phone.net:8088/app/iAppFree/api/free.php?page=%ld&number=20&search=%@")

#define kHotSearchUrl (@"http://1000phone.net:8088/app/iAppFree/api/hot.php?page=%ld&number=20&search=%@")


//详情
#define kDetailUrl (@"http://iappfree.candou.com:8080/free/applications/%@?currency=rmb")

//周边
#define kNearByUrl (@"http://iappfree.candou.com:8080/free/applications/recommend?longitude=116.344539&latitude=40.034346")


//分类
#define kCategoryLimitUrl (@"http://iappfree.candou.com:8080/free/categories/limited")
#define kCategoryReduceUrl (@"http://iappfree.candou.com:8080/free/categories/sales")
#define kCategoryFreeUrl (@"http://iappfree.candou.com:8080/free/categories/free")
#define kCategoryRankUrl (@"http://iappfree.candou.com:8080/free/categories/sales")



