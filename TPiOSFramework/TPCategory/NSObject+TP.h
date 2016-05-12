//
//  NSObject+TP.h
//  MiniCourse
//
//  Created by wang on 16/4/22.
//  Copyright © 2016年 wp. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ tp_expression) (NSNumber **numberValue,NSString *propertyName);

@interface NSObject (TP)

- (void) tp_changeIntergerTypeWithExpression:(tp_expression)expression;

/**
 *  将model的某个整型属性全部进行表达式修改 ，对属性中的model的属性可以仍然有效
 *
 *  @param expression     对某个值可以进行操作的表达式
 *  @param isDeepToBottom 是否递归到所有的属性
 */
- (void) tp_changeIntergerTypeWithExpression:(tp_expression)expression deepLevel:(BOOL)isDeepToBottom;
@end
