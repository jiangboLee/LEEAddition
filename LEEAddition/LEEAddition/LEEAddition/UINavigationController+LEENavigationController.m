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
@end
