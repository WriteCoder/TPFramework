//
//  UIImage+TP.m
//  MiniCourse
//
//  Created by wang on 16/4/22.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "UIImage+TP.h"
#import <SDImageCache.h>
#import <SDWebImageManager.h>

@implementation UIImage (TP)
+ (UIImage *)tp_cacheImageFromUrl:(NSString *)url{
    SDImageCache *imageCacheManager = [SDImageCache sharedImageCache];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSString *key = [manager cacheKeyForURL:[NSURL URLWithString:url]];
    UIImage *backImage = [imageCacheManager imageFromMemoryCacheForKey:key];
    if (!backImage) {
        backImage = [imageCacheManager imageFromDiskCacheForKey:key];
    }
    return backImage;
}
//缓存图片
- (void) tp_uploadedWithUrl:(NSString *)url{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager saveImageToCache:self forURL:[NSURL URLWithString:url]];
}

+ (UIImage *)tp_imageWithColor:(UIColor *)imageColor frame:(CGRect)frame{
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [imageColor CGColor]);
    CGContextFillRect(context, frame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return img;
}
+ (UIImage *)tp_imageWithColor:(UIColor *)imageColor size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [imageColor CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return img;
}
+ (UIImage *)tp_getPartOfImage:(UIImage *)img rect:(CGRect)partRect{
    CGImageRef imageRef = img.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
    UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
    CGImageRelease(imagePartRef);
    return retImg;
}

- (UIImage *) tp_imageWithTintColor:(UIColor *)tintColor
{
    return [self tp_imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *) tp_imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self tp_imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}
- (UIImage *) tp_imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}
- (UIImage*)tp_scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;   //返回的就是已经改变的图片
}

- (CGSize) tp_imageFitWithMaxSize:(CGSize)fitSize{
    CGSize imageSize = self.size;
    if (fitSize.width < imageSize.width) {
        CGFloat ratio = fitSize.width/imageSize.width;
        imageSize.width = fitSize.width;
        imageSize.height = imageSize.height * ratio;
    }
    if (fitSize.height < imageSize.height) {
        CGFloat ratio = fitSize.height/imageSize.height;
        imageSize.height = fitSize.height;
        imageSize.width = imageSize.width * ratio;
    }
    return imageSize;
}
@end
