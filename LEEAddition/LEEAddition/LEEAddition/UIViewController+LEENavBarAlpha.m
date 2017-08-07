//
//  UIViewController+LEENavBarAlpha.m
//  LEEAddition
//
//  Created by ljb48229 on 2017/8/7.
//  Copyright © 2017年 lijiangbo. All rights reserved.
//

#import "UIViewController+LEENavBarAlpha.h"
#import <objc/runtime.h>
#import "UINavigationController+LEENavigationController.h"

static char *VCkey = "UIViewController_LEENavBarAlpha";
@implementation UIViewController (LEENavBarAlpha)

- (void)setNavBarBgAlpha:(NSString *)navBarBgAlpha {

    objc_setAssociatedObject(self, VCkey, navBarBgAlpha, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self.navigationController setNeedsNavigationBackground:[navBarBgAlpha floatValue]];
}

- (NSString *)navBarBgAlpha {

    return objc_getAssociatedObject(self, VCkey);
}

@end





