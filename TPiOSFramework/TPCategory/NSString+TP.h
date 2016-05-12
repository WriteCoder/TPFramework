//
//  NSString+TP.h
//  MiniCourse
//
//  Created by wang on 16/4/22.
//  Copyright © 2016年 wp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TP)
+ (NSString *) tp_uuid;
- (NSString *) tp_md5;

- (BOOL)tp_isPhoneNumber;
- (BOOL)tp_isEmail;

@end
