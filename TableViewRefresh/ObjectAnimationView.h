//
//  ObjectAnimationView.h
//  TableViewRefresh
//
//  Created by YouXianMing on 15/6/25.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshObjectAnimationProtocal.h"

@interface ObjectAnimationView : UIView <RefreshObjectAnimationProtocal>

@property (nonatomic, strong) UIColor   *normalTextColor;
@property (nonatomic, strong) UIColor   *fadeTextColor;
@property (nonatomic, strong) NSString  *normalText;
@property (nonatomic, strong) NSString  *updateText;

@end
