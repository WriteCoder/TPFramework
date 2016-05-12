//
//  UIColor+TP.h
//  MiniCourse
//
//  Created by wang on 16/4/22.
//  Copyright © 2016年 wp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TP)
+ (UIColor *)tp_colorWithHex:(long)hexColor;
+ (UIColor *)tp_colorWithHex:(long)hexColor alpha:(float)alpha;
+ (UIColor *)tp_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
+ (UIColor *)tp_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
+ (UIColor *)tp_colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)tp_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;
@end
