//
//  UITextField+LEETextField.m
//  LEEAddition
//
//  Created by 李江波 on 2017/6/17.
//  Copyright © 2017年 lijiangbo. All rights reserved.
//

#import "UITextField+LEETextField.h"
#import <objc/runtime.h>
@implementation UITextField (LEETextField)

- (void)setPlaceholderColor:(UIColor *)placeholderColor {

    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 获取占位文字label控件
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    // 设置占位文字颜色
    placeholderLabel.textColor = placeholderColor;
}

- (UIColor *)placeholderColor {

    return objc_getAssociatedObject(self, @"placeholderColor");
}
@end
