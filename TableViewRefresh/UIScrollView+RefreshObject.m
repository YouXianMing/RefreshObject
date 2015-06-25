//
//  UIScrollView+RefreshObject.m
//  UIScrollView
//
//  Created by YouXianMing on 15/6/24.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "UIScrollView+RefreshObject.h"
#import <objc/runtime.h>

@implementation UIScrollView (RefreshObject)

#pragma mark - 添加属性

@dynamic refreshObject;

NSString * const _recognizerRefreshObject = @"recognizerRefreshObject";

- (void)setRefreshObject:(RefreshObject *)refreshObject {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerRefreshObject), refreshObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (RefreshObject *)refreshObject {
    
    return objc_getAssociatedObject(self, (__bridge const void *)(_recognizerRefreshObject));
}

#pragma mark -

- (void)addObserver {
    
    if (self.refreshObject && self.refreshObject.scrollView == nil) {
        
        // 获取scrollView
        self.refreshObject.scrollView = self;
        
        // 添加监听
        [self addObserver:self.refreshObject
               forKeyPath:@"contentOffset"
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:nil];
    }
}

- (void)removeObserver {

    if (self.refreshObject) {
        
        // 移除监听
        [self removeObserver:self.refreshObject
                  forKeyPath:@"contentOffset"];
        
        self.refreshObject.scrollView = nil;
        self.refreshObject            = nil;
    }
}


@end
