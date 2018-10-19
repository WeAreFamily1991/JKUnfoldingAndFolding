//
//  JKPeopleModel.m
//  JKUnfoldingAndFolding
//
//  Created by 王冲 on 2017/10/10.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//  欢迎加入iOS开发交流群 584599353

#import "JKPeopleModel.h"

@implementation JKPeopleModel

+ (JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                       @"sectionTitle":@"sectionTitle",@"isExpanded":@"isExpanded",@"sectionNumber":@"sectionNumber",@"sectionNumber2":@"sectionNumber2",@"sectionNumberArray":@"sectionNumberArray",
                                                       }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
