//
//  UILabel+autoLayout.m
//  毕业论文-欢乐聚
//
//  Created by 吴显吉 on 16/1/21.
//  Copyright © 2016年 wuxianji. All rights reserved.
//

#import "UILabel+autoLayout.h"

@implementation UILabel (autoLayout)


+ (CGFloat)autoLayoutHeightWithText:(NSString *)text
                              width:(CGFloat)width
                           fontSize:(NSInteger)intNum {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:intNum]} context:nil];
    return rect.size.height;
}

- (void)autoResizeWithLimitWidth:(NSInteger)Width
{
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil];
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(Width, MAXFLOAT)
                                          options:(NSStringDrawingOptions)(
                                                                           NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading)
                                       attributes:tdic
                                          context:nil].size;
    
    [self setSize:CGSizeMake(size.width, size.height)];
}


@end
