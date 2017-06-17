//
//  UIColor+LEEColor.h
//  LEEAddition
//
//  Created by 李江波 on 2017/6/17.
//  Copyright © 2017年 lijiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LEEColor)

/**
 使用 16 进制数字创建颜色，例如 0xFF0000 创建红色

 @param hex 16 进制无符号32位整数
 @return 颜色
 */
+ (instancetype)Lee_colorWithHex:(uint32_t)hex;

/**
 随机颜色

 @return 随机颜色
 */
+ (instancetype)Lee_randomColor;
/**
 使用 R / G / B 数值创建颜色
 @return 颜色
 */

+ (instancetype)Lee_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;
@end
