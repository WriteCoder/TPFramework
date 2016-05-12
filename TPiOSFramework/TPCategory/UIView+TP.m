//
//  UIView+TP.m
//  MiniCourse
//
//  Created by wang on 16/4/22.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "UIView+TP.h"
#import <objc/runtime.h>

@implementation UIView (TP) 
- (UIViewController *)tp_getViewController
{
    UIResponder *responder = self;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

- (UIView *)tp_getSuperViewWithClassName:(NSString *)className
{
    
    UIResponder *responder = self;
    while (responder) {
        Class class = [responder class];
        NSString *tempClassName = NSStringFromClass(class);
        if ([tempClassName isEqualToString:className]) {
            return (UIView *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}
- (UIImageView *)tp_screenShotView{
    UIImage *screenShotImage = [self tpScreenShot];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.image = screenShotImage;
    return imageView;
}

static char kTPWhenTappedBlockKey;
- (void)tp_whenTapped:(TPWhenTappedBlock)block {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tp_viewWasTapped)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, &kTPWhenTappedBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)tp_viewWasTapped {
    TPWhenTappedBlock action = objc_getAssociatedObject(self, &kTPWhenTappedBlockKey);
    if (action) {
        action();
    }
}

- (UIView *)tp_addHorizontalSeperateLine:(BOOL)left {
    UIView *sepLine = [UIView new];
    sepLine.backgroundColor = [UIColor tp_horizontalSepLine];
    [self addSubview:sepLine];
    [sepLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.equalTo(0.5);
        if (left) {
            make.left.equalTo(self);
        } else {
            make.right.equalTo(self);
        }
    }];
    return sepLine;
}

- (UIView *)tp_addVerticalSeperateLine:(BOOL)top {
    UIView *sepLine = [UIView new];
    sepLine.backgroundColor = [UIColor tp_verticalSepLine];
    [self addSubview:sepLine];
    [sepLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        if (top) {
            make.top.equalTo(self);
        } else {
            make.bottom.equalTo(self);
        }
    }];
    return sepLine;
}

@end
