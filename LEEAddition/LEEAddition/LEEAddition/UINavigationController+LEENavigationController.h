//
//  UINavigationController+LEENavigationController.h
//  LEEAddition
//
//  Created by 李江波 on 2017/6/17.
//  Copyright © 2017年 lijiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (LEENavigationController)

///用于导航控制器回跳到指定控制器
- (UIViewController *)findNeedChildController:(Class)clz;
///设置导航栏的透明度
- (void)setNeedsNavigationBackground:(CGFloat)alpha;
@end
