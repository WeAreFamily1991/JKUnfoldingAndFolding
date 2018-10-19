//
//  JKPeopleModel.h
//  JKUnfoldingAndFolding
//
//  Created by 王冲 on 2017/10/10.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JKPeopleModel;

@interface JKPeopleModel : JSONModel

/** 头部*/
@property (nonatomic, strong) NSString *sectionTitle;

/** 人数*/
@property (nonatomic, strong) NSString *sectionNumber;

/** 选择过的人数*/
@property (nonatomic, strong) NSString *sectionNumber2;

/** 是否展开*/
@property (nonatomic, assign) BOOL isExpanded;

/** 选择过的人数*/
@property (nonatomic, strong) NSMutableArray *sectionNumberArray;

@end
