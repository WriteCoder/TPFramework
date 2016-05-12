//
//  UIImageView+TP.m
//  Experience
//
//  Created by wang on 16/4/13.
//  Copyright © 2016年 Mike. All rights reserved.
//

#import "UIImageView+TP.h"

@implementation UIImageView (TP)
- (void) tp_imageNamed:(NSString *)imageName {
    if (!imageName) {
        return;
    }
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:imageName ofType:nil];
    NSData *imageData = [NSData dataWithContentsOfFile:path];
    self.image = [UIImage imageWithData:imageData];
    
}

@end
