//
//  ViewController.m
//  WXJOptionsView
//
//  Created by MrWXJ on 2018/8/6.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"显示" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)show {
//    @"这是头部标题"
    [[[WXJOptionsView alloc] initWithOptionsArray:@[@"保存图片",@"查看大图",@"识别图中二维码",@"投诉"] headerText:nil didSelectRowIndexPath:^(NSIndexPath * _Nullable indexPath) {
        NSLog(@"%ld",indexPath.row);
    }] show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
