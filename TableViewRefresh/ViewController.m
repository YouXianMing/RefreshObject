//
//  ViewController.m
//  TableViewRefresh
//
//  Created by YouXianMing on 15/6/25.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
#import "UIScrollView+RefreshObject.h"
#import "ObjectAnimationView.h"

#define CELL             @"cell"
#define VIEW_HEIGHT      64.f

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, RefreshObjectDelegate>

@property (nonatomic, strong) UITableView         *tableView;
@property (nonatomic, strong) ObjectAnimationView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    self.tableView            = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL];
    [self.view addSubview:self.tableView];
    
    
    RefreshObject *refresh       = [RefreshObject new];
    refresh.height               = VIEW_HEIGHT;
    refresh.delegate             = self;
    self.tableView.refreshObject = refresh;
    [self.tableView addObserver];
    
    
    self.animationView                   = [[ObjectAnimationView alloc] initWithFrame:CGRectMake(0, -VIEW_HEIGHT, 320, VIEW_HEIGHT)];
    self.animationView.layer.borderWidth = 1.f;
    self.animationView.normalText        = @"pull down ...";
    self.animationView.updateText        = @"release to refresh ...";
    self.animationView.normalTextColor   = [UIColor blackColor];
    self.animationView.fadeTextColor     = [UIColor redColor];
    [self.tableView addSubview:self.animationView];
}


#pragma mark - 刷新代理
- (void)startRefreshing:(RefreshObject *)refreshObject {
    
    [self.animationView startRefreshAnimation];
    
    // 2秒钟后结束刷新
    [GCDQueue executeInMainQueue:^{
        [refreshObject endRefresh];
    } afterDelaySecs:2];
}

- (void)endRefresh:(RefreshObject *)refreshObject {
    
    [self.animationView endRefreshAnimation];
}

- (void)moving:(RefreshObject *)refreshObject offset:(CGFloat)offset percent:(CGFloat)percent {
    
    [self.animationView animationWithPercent:percent];
}


#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    cell.textLabel.text   = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    return cell;
}

#pragma mark - 
- (void)dealloc {
    
    [self.tableView removeObserver];
}

@end
