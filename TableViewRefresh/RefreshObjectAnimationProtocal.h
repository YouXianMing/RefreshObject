//
//  RefreshObjectAnimationProtocal.h
//  TableViewRefresh
//
//  Created by YouXianMing on 15/6/25.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RefreshObjectAnimationProtocal <NSObject>

@required
- (void)animationWithPercent:(CGFloat)percent;
- (void)startRefreshAnimation;
- (void)endRefreshAnimation;

@end
