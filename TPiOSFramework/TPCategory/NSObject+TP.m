//
//  NSObject+TP.m
//  MiniCourse
//
//  Created by wang on 16/4/22.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "NSObject+TP.h"
#import <objc/runtime.h>

@implementation NSObject (TP)
- (void) tp_changeIntergerTypeWithExpression:(tp_expression)expression{
    [self tp_changeIntergerTypeWithExpression:expression deepLevel:NO];
}

- (void) tp_changeIntergerTypeWithExpression:(tp_expression)expression deepLevel:(BOOL)isDeepToBottom{
    
    //解析该类的属性
    unsigned int outCount, i;
    objc_property_t *properties =class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if ([propertyValue isKindOfClass:[NSNumber class]]) {
            expression(&propertyValue,propertyName);
            [self setValue:propertyValue forKey:propertyName];
        }else{
            //其他类型
            if(isDeepToBottom){
                
                NSBundle *mainB = [NSBundle bundleForClass:[propertyValue class]];
                if (mainB == [NSBundle mainBundle]) {
                    //自定义的类
                    [propertyValue tp_changeIntergerTypeWithExpression:expression deepLevel:isDeepToBottom];
                }else{
                    //系统的类
                    if ([propertyValue isKindOfClass:[NSArray class]]) {
                        for (id object in (NSArray *)propertyValue) {
                            [object tp_changeIntergerTypeWithExpression:expression deepLevel:isDeepToBottom];
                        }
                    }
                }
            }
            
        }
    }
    free(properties);
}
@end
