//
//  UIFont+TP.h
//  Experience
//
//  Created by WangYouming on 16/4/19.
//  Copyright © 2016年 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (TP)

+ (UIFont *)tp_fontBoldWithSize:(CGFloat)size; //粗体
+ (UIFont *)tp_fontRegularWithSize:(CGFloat)size; //常规体
+ (UIFont *)tp_fontThinWithSize:(CGFloat)size; //细体
+ (UIFont *)tp_fontSuperThinWithSize:(CGFloat)size;//纤细体
@end
