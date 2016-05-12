//
//  UIView+TP.h
//  MiniCourse
//
//  Created by wang on 16/4/22.
//  Copyright © 2016年 wp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TPWhenTappedBlock)();

@interface UIView (TP) <UIGestureRecognizerDelegate>

- (UIViewController *)tp_getViewController;//获取当前视图所在的视图控制器
- (UIView *)tp_getSuperViewWithClassName:(NSString *)className;//获取父视图，直到父视图是指定的类
- (UIImageView *)tp_screenShotView;

@end

