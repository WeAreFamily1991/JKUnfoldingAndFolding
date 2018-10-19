//
//  PeopleHeaderFooterView.h
//  JKUnfoldingAndFolding
//
//  Created by 王冲 on 2017/10/10.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKPeopleModel.h"
@interface PeopleHeaderFooterView : UITableViewHeaderFooterView

@property(nonatomic,strong) UIImageView *smallImageView;

@property(nonatomic,strong) UILabel *biaoTi;

@property(nonatomic,strong) UILabel *smallBiaoTi;

@property(nonatomic,strong) UIView *lineView;


@property(nonatomic,strong) void(^schoolhead)(BOOL);

@property (nonatomic, strong) JKPeopleModel *sectionModel;


@end
