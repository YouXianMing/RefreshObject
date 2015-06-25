//
//  ObjectAnimationView.m
//  TableViewRefresh
//
//  Created by YouXianMing on 15/6/25.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ObjectAnimationView.h"

@interface ObjectAnimationView ()

@property (nonatomic, strong) UILabel *normalLabel;
@property (nonatomic, strong) UILabel *updateLabel;

@end

@implementation ObjectAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.updateLabel               = [[UILabel alloc] initWithFrame:self.bounds];
        self.updateLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.updateLabel];
        
        
        self.normalLabel               = [[UILabel alloc] initWithFrame:self.bounds];
        self.normalLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.normalLabel];
        
        
        self.updateLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:25.f];
        self.normalLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:25.f];
        
    }
    
    return self;
}

- (void)animationWithPercent:(CGFloat)percent {

    if (percent < 1.f) {
        self.normalLabel.text = _normalText;
        self.updateLabel.text = _normalText;
    } else {
        self.normalLabel.text = _updateText;
        self.updateLabel.text = _updateText;
    }
    
    self.normalLabel.alpha = 1 - percent;
}

- (void)startRefreshAnimation {

    self.updateLabel.text = @"refreshing ...";
    self.normalLabel.text = @"refreshing ...";
    
    [UIView animateWithDuration:1.f animations:^{
        
        self.backgroundColor = [UIColor blackColor];
        
    } completion:^(BOOL finished) {
        
        self.updateLabel.text = @"sucess";
        self.normalLabel.text = @"sucess";
    }];
    
    

    
}

- (void)endRefreshAnimation {

    [UIView animateWithDuration:1.f animations:^{
        self.backgroundColor = [UIColor clearColor];
    }];
    
}

@synthesize normalTextColor = _normalTextColor;
- (void)setNormalTextColor:(UIColor *)normalTextColor {
    
    _normalTextColor       = normalTextColor;
    _normalLabel.textColor = normalTextColor;
}

- (UIColor *)normalTextColor {

    return _normalLabel.textColor;
}

@synthesize fadeTextColor = _fadeTextColor;
- (void)setFadeTextColor:(UIColor *)fadeTextColor {

    _fadeTextColor         = fadeTextColor;
    _updateLabel.textColor = fadeTextColor;
}

- (UIColor *)fadeTextColor {
    
    return _updateLabel.textColor;
}

@end
