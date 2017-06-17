//
//  UIScreen+LEEScreen.m
//  LEEAddition
//
//  Created by 李江波 on 2017/6/17.
//  Copyright © 2017年 lijiangbo. All rights reserved.
//

#import "UIScreen+LEEScreen.h"

@implementation UIScreen (LEEScreen)

+ (CGFloat)Lee_screenWidth {

    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)Lee_screenHeight {

    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)Lee_screenScale {

    return [UIScreen mainScreen].scale;
}

@end
