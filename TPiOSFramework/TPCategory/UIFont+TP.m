//
//  UIFont+TP.m
//  Experience
//
//  Created by WangYouming on 16/4/19.
//  Copyright © 2016年 Mike. All rights reserved.
//

#import "UIFont+TP.h"

@implementation UIFont (TP)

+ (UIFont *)tp_fontBoldWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:size];
}
//常规
+ (UIFont *)tp_fontRegularWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}
//细体
+ (UIFont *)tp_fontThinWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
}
//极细 纤细
+ (UIFont *)tp_fontSuperThinWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:size];
}

@end
