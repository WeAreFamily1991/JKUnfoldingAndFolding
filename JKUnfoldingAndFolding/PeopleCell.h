//
//  PeopleCell.h
//  JKUnfoldingAndFolding
//
//  Created by 王冲 on 2017/10/10.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleCell : UITableViewCell

/*
 *  选择的小图标
 */
@property (nonatomic,strong) UIImageView *smallImageView;

/*
 *  人的头像
 */
@property (nonatomic,strong) UIImageView *peopleImageView;

/*
 *  公司和职位
 */
@property (nonatomic,strong) UILabel     *gZbiaoTi;

/*
 *  最后的lineView
 */
@property (nonatomic,strong) UIView     *lineView;



@end
