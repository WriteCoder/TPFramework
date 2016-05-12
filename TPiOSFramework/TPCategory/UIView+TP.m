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
    UIImage *screenShotImage = [self tp_screenShotImage];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.image = screenShotImage;
    return imageView;
}
- (UIImage *)tp_screenShotImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 1);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return uiImage;
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

@end
