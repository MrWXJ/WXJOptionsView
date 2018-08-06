//
//  WXJOptionsView.m
//  Iplus
//
//  Created by MrWXJ on 2018/8/6.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

#import "WXJOptionsView.h"

#define Options_W  [UIScreen mainScreen].bounds.size.width
#define Options_H  [UIScreen mainScreen].bounds.size.height

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface WXJOptionsView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) DidSelectRowIndexPath didSelectRowIndexPath;

@property (nonatomic,strong) NSArray *optionsArray;
@property (nonatomic,strong) NSString *headerText;

@property (nonatomic,assign) CGFloat headerHeight;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITableViewCell *cell;

@end

@implementation WXJOptionsView

- (instancetype)initWithOptionsArray:(NSArray *)optionsArray
                          headerText:(NSString *)headerText
               didSelectRowIndexPath:(DidSelectRowIndexPath)didSelectRowIndexPath {
    self = [super initWithFrame:CGRectMake(0, 0, Options_W, Options_H)];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    if (self) {
        
        self.optionsArray = [NSArray arrayWithArray:optionsArray];
        self.headerText = headerText;
        self.didSelectRowIndexPath = didSelectRowIndexPath;
        
        
        if (_headerText.length > 0) {
            //先计算出头部的高度
            _headerHeight = [UILabel autoLayoutHeightWithText:_headerText width:Options_W - 20 fontSize:17] + 30.0f;
            if (_headerHeight < 55.0f) {
                _headerHeight = 55.0f;
            }
        } else {
            _headerHeight = 0;
        }
        
        [self createTableView];
    }
    return self;
}


/**
 创建tableView
 */
- (void)createTableView {
    CGFloat h = _headerHeight + _optionsArray.count * 55.0f + 50.0f;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Options_H - h, Options_W, h) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.separatorColor = [UIColor clearColor];
    [self addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.optionsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 55.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return _headerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_headerHeight > 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Options_W, _headerHeight)];
        view.backgroundColor = RGBA(250, 250, 250, 1);
        UILabel *label = [UILabel initLabelWithFrame:CGRectMake(10, 0, Options_W-20, _headerHeight) bgColor:[UIColor clearColor] textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:17] text:_headerText alignment:1];
        
        [view addSubview:label];
        label.centerY = view.height*.5;
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _headerHeight-1, Options_W, 1)];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.1;
        [view addSubview:line];
        return view;
    } else {
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Options_W, 55.0f)];
    view.backgroundColor = RGBA(244, 244, 244, 1);
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, Options_W, 50)];
    [cancelBtn setTitle:@"取 消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancelBtn addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setBackgroundColor:RGBA(250, 250, 250, 1)];
    [view addSubview:cancelBtn];
    return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"Cell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!_cell) {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        _cell.backgroundColor = RGBA(250, 250, 250, 1);
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Options_W, 54)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = 1;
        [_cell.contentView addSubview:_titleLabel];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 54, Options_W, 1)];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.1;
        [_cell.contentView addSubview:line];
    }
    _titleLabel.text = self.optionsArray[indexPath.row];
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self cancelBtn:nil];
        if (self.didSelectRowIndexPath) {
            self.didSelectRowIndexPath(indexPath);
        }
    });
}

/**
 显示View
 */
- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    self.tableView.y = Options_H;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.y = Options_H - _tableView.height;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    } completion:^(BOOL finished) {
        
    }];
}

// 移除视图
- (void)cancelBtn:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.y = Options_H;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.tableView removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self cancelBtn:nil];
}


@end
