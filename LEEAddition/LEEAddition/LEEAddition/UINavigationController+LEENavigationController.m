//
//  UINavigationController+LEENavigationController.m
//  LEEAddition
//
//  Created by 李江波 on 2017/6/17.
//  Copyright © 2017年 lijiangbo. All rights reserved.
//

#import "UINavigationController+LEENavigationController.h"

@implementation UINavigationController (LEENavigationController)

- (UIViewController *)findNeedChildController:(Class)clz {

    for (int i = 0; i < self.childViewControllers.count; i ++) {
        if ([self.childViewControllers[i] isKindOfClass:clz]) {
            return self.childViewControllers[i];
        }
    }
    return nil;
}

- (void)setNeedsNavigationBackground:(CGFloat)alpha {
    // 导航栏背景透明度设置
    UIView *barBackgroundView = [[self.navigationBar subviews] objectAtIndex:0]; // _UIBarBackground
    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0]; // UIImageView
    if (self.navigationBar.isTranslucent) {
        if (backgroundImageView != nil && backgroundImageView.image != nil) {
            barBackgroundView.alpha = alpha;
        } else {
            UIView *backgroundEffectView = [[barBackgroundView subviews]objectAtIndex:1];
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
        
    } else {
        barBackgroundView.alpha = alpha;
    }
    self.navigationBar.clipsToBounds = alpha == 0.0;
}
@end








