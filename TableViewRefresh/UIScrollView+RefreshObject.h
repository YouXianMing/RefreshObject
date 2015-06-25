//
//  UIScrollView+RefreshObject.h
//  UIScrollView
//
//  Created by YouXianMing on 15/6/24.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshObject.h"


@interface UIScrollView (RefreshObject)

/**
 *  需要主动赋值
 */
@property (nonatomic, strong)  RefreshObject  *refreshObject;

/**
 *  添加观察者
 */
- (void)addObserver;

/**
 *  移除观察者
 */
- (void)removeObserver;

@end
