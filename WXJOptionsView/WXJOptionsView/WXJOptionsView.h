//
//  WXJOptionsView.h
//  Iplus
//
//  Created by MrWXJ on 2018/8/6.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//
//-------------
//选项view
//-------------

#import <UIKit/UIKit.h>
#import "UIView+WXJExtension.h"
#import "UILabel+WXJExtension.h"
#import "UILabel+autoLayout.h"

/**
 点击的indexPath

 @param indexPath indexPath
 */
typedef void(^DidSelectRowIndexPath)(NSIndexPath * _Nullable indexPath);

@interface WXJOptionsView : UIView

- (instancetype _Nullable )initWithOptionsArray:(NSArray *_Nonnull)optionsArray
                          headerText:(NSString *_Nullable)headerText
               didSelectRowIndexPath:(DidSelectRowIndexPath _Nonnull )didSelectRowIndexPath;

/**
 显示View
 */
- (void)show;

@end
