//
//  UILabel+WXJExtension.h
//  Iplus
//
//  Created by 贵州众智博信 on 2017/10/23.
//  Copyright © 2017年 zzbx. All rights reserved.
//
//-------------
//UILabel 类别
//-------------

#import <UIKit/UIKit.h>
#import "UIView+WXJExtension.h"

@interface UILabel (WXJExtension)

/**
 创建UILabel,快速配置相关属性,便捷
 
 @param frame frame
 @param bgColor 背景颜色(可为nil)
 @param text 内容(可为nil)
 @param textColor 文字颜色(可为nil)
 @param fontName 字体(可为nil)
 @param fontSize 字号
 @param lines 行数
 @param alignment 对齐方式
 @return UILabel
 */
+ (instancetype)initWithFrame:(CGRect)frame
                     bgdColor:(UIColor *)bgColor
                         text:(NSString *)text
                    textColor:(UIColor *)textColor
                     fontName:(NSString *)fontName
                     fontSize:(CGFloat)fontSize
                        lines:(NSInteger)lines
                    alignment:(NSTextAlignment)alignment;

/**
 根据文字来调整label的高度
 
 @param label label
 @param text text
 */
+ (void)adjustmentHeightWithLabel:(UILabel *)label
                             text:(NSString *)text;

/**
 改变label的行间距
 
 @param label label
 @param spacing 行间距
 */
+ (void)changeLineSpacingWithLabel:(UILabel *)label
                           spacing:(CGFloat)spacing;

/**
 改变label的字间距
 
 @param label label
 @param spacing 字间距
 */
+ (void)changeWordSpacingWithLabel:(UILabel *)label
                           spacing:(CGFloat)spacing;

/**
 改变label的行间距和字间距
 
 @param label label
 @param lineSpacing 行间距
 @param WordSpacing 字间距
 */
+ (void)changeSpacingWithLabel:(UILabel *)label
                   lineSpacing:(CGFloat)lineSpacing
                   WordSpacing:(CGFloat)WordSpacing;








#pragma 废弃



/**
 UILabel创建

 @param frame 尺寸
 @param bgColor 背景颜色
 @param textColor 字体颜色
 @param font 字体 及 大小
 @param text 内容
 @param alignment 对准
 @return UILabel
 */
+ (instancetype)initLabelWithFrame:(CGRect)frame
                           bgColor:(UIColor *)bgColor
                         textColor:(UIColor *)textColor
                              font:(UIFont *)font
                              text:(NSString *)text
                         alignment:(NSTextAlignment)alignment;

+ (void)autoLayoutWithLabel:(UILabel *)label
                       text:(NSString *)text;

/**
 添加UILabel

 @param view 要显示在的view
 */
- (void)showInView:(UIView *)view;

@end
