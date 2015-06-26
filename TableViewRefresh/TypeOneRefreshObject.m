//
//  TypeOneRefreshObject.m
//  TableViewRefresh
//
//  Created by YouXianMing on 15/6/26.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "TypeOneRefreshObject.h"

@implementation TypeOneRefreshObject


- (void)refreshingAnimation {
    
    [UIView animateWithDuration:1 animations:^{
        self.scrollView.contentInset = UIEdgeInsetsMake(self.height, 0, 0, 0);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)endRefreshAnimation {
    
    [UIView animateWithDuration:1 animations:^{
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    } completion:^(BOOL finished) {
        [self changeState:NORMAL_STATE];
    }];
}

@end
