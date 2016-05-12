//
//  UIImage+TP.h
//  MiniCourse
//
//  Created by wang on 16/4/22.
//  Copyright © 2016年 wp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TP)
+ (UIImage *)tp_cacheImageFromUrl:(NSString *)url;
+ (UIImage *)tp_imageWithColor:(UIColor *)imageColor frame:(CGRect)frame;
+ (UIImage *)tp_imageWithColor:(UIColor *)imageColor size:(CGSize)size;
+ (UIImage *)tp_getPartOfImage:(UIImage *)img rect:(CGRect)partRect;


- (UIImage *) tp_imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) tp_imageWithGradientTintColor:(UIColor *)tintColor;

//根据当前图片计算出在规定的范围内显示的最大尺寸
- (CGSize) tp_imageFitWithMaxSize:(CGSize)fitSize;
- (UIImage*)tp_scaleToSize:(CGSize)size;

- (void) tp_uploadedWithUrl:(NSString *)url;//图片上传之后复制到缓存目录，注意，这个过程是异步调用，调用这个方法的时候不能马上释放掉image否则缓存失败，建议删除原始图片的时候检查一下是否缓存成功，如果没有缓存成功，则不删除原始文件

@end
