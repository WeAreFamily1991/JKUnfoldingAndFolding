//
//  CIOTip.h
//  CIOTimes
//
//  Created by 王冲 on 2017/2/23.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CIOTip : NSObject

/*
 *  target当前的控制器
 *  str 提示文字
 *  type 类型  0 不返回 1返回
 */
+(void)tishi:(UIViewController *)target withString:(NSString *)str withtype:(NSString *)type;

+(void)tishi1:(UIViewController *)target withString:(NSString *)str withtype:(NSString *)type;
+(void)tishi2:(UIViewController *)target withString:(NSString *)str withtype:(NSString *)type;

@end
