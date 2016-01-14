//
//  JLControl.h
//  BigPrivateSchool
//
//  Created by 沈家林 on 15/9/29.
//  Copyright (c) 2015年 沈家林. All rights reserved.
//
//可以把特殊的功能点，写在一个类中，用它的类方法来调用
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JLControl : NSObject
+ (void)cancelWebCache;                                 //清除UIWebView的缓存
+ (BOOL)checkPhoneNumber:(NSString *)str;               //验证手机号码是否合法
+ (void)saveLocalData:(id)obj forKey:(NSString *)key;   //保存数据到本地
+ (void)removeLocalData:(NSString *)key;                //移除本地数据
+ (id)getLocalData:(NSString *)key;                     //读取本地数据
+ (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize; //根据尺寸压缩图片

#pragma mark 创建时间转换字符串
+(NSString *)stringFromDateWithHourAndMinute:(NSDate *)date;

#pragma mark 对字符串的判断 对nil进行了处理
+ (BOOL)isNumber:(NSString*)string;
+ (BOOL)isNumberAndString:(NSString*)string;
+ (BOOL)isContainChinese:(NSString*)string;


#pragma mark 返回字体尺寸
+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;
+ (CGSize)labelAutoCalculateRectWith:(NSString*)text Font:(UIFont *)font MaxSize:(CGSize)maxSize;

#pragma mark 空间的创建

+(UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)text withIsLineBreak:(BOOL)isLineBreak;

+(UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)text;
+(UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)text withFontSize:(CGFloat)size;
+(UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)text withFontSize:(CGFloat)size withTextColor:(UIColor *)color;
+(UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)text withFontSize:(CGFloat)size withTextColor:(UIColor *)color withTextAlignment:(NSTextAlignment)textAlignment;
+(UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)text withFontSize:(CGFloat)size withTextColor:(UIColor *)color withTextAlignment:(NSTextAlignment)textAlignment withIsLineBreak:(BOOL)isLineBreak;

+(UIButton*)createButtonWithFrame:(CGRect)frame withTitle:(NSString *)title withTarget:(id)target withAction:(SEL)action;
+(UIImageView *)createImageViewWithFrame:(CGRect)frame withImageName:(NSString *)imageName;
@end
