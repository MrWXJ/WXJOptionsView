//
//  UILabel+WXJExtension.m
//  Iplus
//
//  Created by 贵州众智博信 on 2017/10/23.
//  Copyright © 2017年 zzbx. All rights reserved.
//

#import "UILabel+WXJExtension.h"

@implementation UILabel (WXJExtension)

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
                    alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (bgColor != nil) {
        label.backgroundColor = bgColor;
    }
    label.text = [NSString stringWithFormat:@"%@",text];
    if (textColor != nil) {
        label.textColor = textColor;
    }
    if (fontName != nil) {
        label.font = [UIFont fontWithName:fontName size:fontSize];
    } else {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    label.numberOfLines = lines;
    label.textAlignment = alignment;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    return label;
}

+ (instancetype)initLabelWithFrame:(CGRect)frame
                           bgColor:(UIColor *)bgColor
                         textColor:(UIColor *)textColor
                              font:(UIFont *)font
                              text:(NSString *)text
                     alignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    label.font = font;
    label.text = [NSString stringWithFormat:@"%@",text];
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    return label;
}

/**
 根据文字来调整label的高度

 @param label label
 @param text text
 */
+ (void)adjustmentHeightWithLabel:(UILabel *)label
                             text:(NSString *)text {
    //取得lable的宽度
    CGFloat width = label.frame.size.width;
    //取得label的字体
    UIFont *font = label.font;
    //计算rect值
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    //最后调整再调整label的高度
    label.height = rect.size.height;
}


/**
 改变label的行间距

 @param label label
 @param spacing 行间距
 */
+ (void)changeLineSpacingWithLabel:(UILabel *)label
                           spacing:(CGFloat)spacing {
    CGFloat label_h = label.frame.size.height;
    NSString *label_text = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label_text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label_text length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    CGFloat label_newH = label.frame.size.height;
    if (label_newH > label_h) {
        label.height = label_h;
    }
//    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
}

/**
 改变label的字间距

 @param label label
 @param spacing 字间距
 */
+ (void)changeWordSpacingWithLabel:(UILabel *)label
                           spacing:(CGFloat)spacing {
    CGFloat label_h = label.frame.size.height;
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(spacing)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    CGFloat label_newH = label.frame.size.height;
    if (label_newH > label_h) {
        label.height = label_h;
    }
//    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
}

/**
 改变label的行间距和字间距

 @param label label
 @param lineSpacing 行间距
 @param WordSpacing 字间距
 */
+ (void)changeSpacingWithLabel:(UILabel *)label
                   lineSpacing:(CGFloat)lineSpacing
                   WordSpacing:(CGFloat)WordSpacing {
    CGFloat h1 = label.frame.size.height;
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(WordSpacing)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    CGFloat h2 = label.frame.size.height;
    if (h2 > h1) {
        label.height = h1;
    }
    label.lineBreakMode = NSLineBreakByTruncatingTail;
//    label.lineBreakMode = NSLineBreakByCharWrapping;
}


+ (void)autoLayoutWithLabel:(UILabel *)label
                       text:(NSString *)text {
    CGFloat width = label.width;
    UIFont *font = label.font;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    label.height = rect.size.height;
}


- (void)showInView:(UIView *)view {
    [view addSubview:self];
}


@end
