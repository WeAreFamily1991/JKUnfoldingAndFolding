//
//  PeopleCell.m
//  JKUnfoldingAndFolding
//
//  Created by 王冲 on 2017/10/10.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//  欢迎加入iOS开发交流群 584599353

#import "PeopleCell.h"

@implementation PeopleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        /*
         *  头像view的添加
         */
        _smallImageView = [[UIImageView alloc]initWithFrame:CGRectMake(40,14,16, 16)];
        //_iconImageView.backgroundColor = backGayCOLOR;
        [self.contentView addSubview:_smallImageView];
        
        /*
         *  头像view的添加
         */
        UIView *iconImageView = [[UIView alloc]initWithFrame:CGRectMake(68,10,24, 24)];
        iconImageView.layer.cornerRadius = 12;
        iconImageView.clipsToBounds = YES;
        iconImageView.backgroundColor = backGayCOLOR;
        iconImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:iconImageView];
        /*
         *  头像view的添加
         */
        _peopleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(1,1,22, 22)];
        _peopleImageView.layer.cornerRadius = 11;
        _peopleImageView.contentMode = UIViewContentModeScaleAspectFill;
        _peopleImageView.clipsToBounds = YES;
        //_iconImageView.backgroundColor = backGayCOLOR;
        [iconImageView addSubview:_peopleImageView];
        
        /*
         *  标题的添加
         */
        _gZbiaoTi = [[UILabel alloc]initWithFrame:CGRectMake(100, 14, JKWIDTH-100-14, 16)];
        //_biaoTi.backgroundColor = JKRandomColor;
        _gZbiaoTi.textColor = TitleBlackCOLOR;
        _gZbiaoTi.font = [UIFont systemFontOfSize:14.f];
        _gZbiaoTi.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_gZbiaoTi];
        
        
        /*
         * 横线
         */
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(40, 43.5, JKWIDTH-40-12, 0.5)];
        _lineView.backgroundColor = backGayCOLOR;
        [self.contentView addSubview:_lineView];
        
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
