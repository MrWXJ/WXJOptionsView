# WXJOptionsView
选项卡


[[[WXJOptionsView alloc] initWithOptionsArray:@[@"保存图片",@"查看大图",@"识别图中二维码",@"投诉"] headerText:nil didSelectRowIndexPath:^(NSIndexPath * _Nullable indexPath) {
        NSLog(@"%ld",indexPath.row);
    }] show];
