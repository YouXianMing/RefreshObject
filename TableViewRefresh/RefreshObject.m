//
//  RefreshObject.m
//  UIScrollView
//
//  Created by YouXianMing on 15/6/24.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "RefreshObject.h"

@interface RefreshObject ()

@end

@implementation RefreshObject

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    
    // 当前位置
    float currentPostion = _scrollView.contentOffset.y;
    
    
    if (_scrollView.isDragging) {
        // 拖拽中
        
        if (_state == NORMAL_STATE) {
            
            // 获取位移的信息
            if (_delegate) {
                
                CGFloat percent = 0;
                if (currentPostion <= 0) {
                    percent = -currentPostion / _height;
                }
                
                [_delegate moving:self offset:currentPostion percent:percent];
            }
        }
        
    } else {
        // 停止拖拽
        
        if (currentPostion < -_height) {
            
            [self beginRefreshing];
        }
    }
    

}

- (void)beginRefreshing {
    
    if (_state == NORMAL_STATE) {
        _state = REFRESH_STATE;
        
        
        if (_delegate) {
            [_delegate startRefreshing:self];
        }
        
        
        [UIView animateWithDuration:0.3 animations:^{
            _scrollView.contentInset = UIEdgeInsetsMake(_height, 0, 0, 0);
        } completion:^(BOOL finished) {

        }];
    }
}

- (void)endRefresh {
    
    if (_delegate) {
        [_delegate endRefresh:self];
    }
    
    [UIView animateWithDuration:0.3f animations:^{
        _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    } completion:^(BOOL finished) {
        _state = NORMAL_STATE;
    }];
}

@end
