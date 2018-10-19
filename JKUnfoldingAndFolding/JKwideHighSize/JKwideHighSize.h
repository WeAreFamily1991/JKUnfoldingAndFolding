//
//  JKwideHighSize.h
//  大小取值
//
//  Created by 王冲 on 2017/2/19.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JKwideHighSize : NSObject

/*
 *  string:输入的内容
 *  font:字体的大小
 *  maxSize:最大宽高的设置
 *  例如: cell.workExperienceContent.width = [JKwideHighSize string:jingyanPanduan sizeWithFont:[UIFont systemFontOfSize:12.f] maxSize:CGSizeMake(300, 12.f)].width+5;(一个文本的宽)
 */
+(CGSize)string:(NSString *)string sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
