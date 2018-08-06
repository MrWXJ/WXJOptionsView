//
//  UILabel+autoLayout.h
//  毕业论文-欢乐聚
//
//  Created by 吴显吉 on 16/1/21.
//  Copyright © 2016年 wuxianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+WXJExtension.h"

@interface UILabel (autoLayout)

/**
 根据宽度、文字、字体大小 来计算label的高度

 @param text 适配的文字
 @param width Label的宽度
 @param intNum 字体大小
 @return 返回高度
 */
+ (CGFloat)autoLayoutHeightWithText:(NSString *)text
                              width:(CGFloat)width
                           fontSize:(NSInteger)intNum;

/**
 设置label 适配高度

 @param Width 宽度
 */
- (void)autoResizeWithLimitWidth:(NSInteger)Width;




@end
