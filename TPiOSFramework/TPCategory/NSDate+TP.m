//
//  NSDate+TP.m
//  Experience
//
//  Created by WangYouming on 16/4/18.
//  Copyright © 2016年 Mike. All rights reserved.
//

#import "NSDate+TP.h"

@implementation NSDate (TP)

+ (NSInteger)tp_microTimeIntervalSince1970 {
    return [NSDate date].timeIntervalSince1970 * 1000 * 1000;
}

@end
