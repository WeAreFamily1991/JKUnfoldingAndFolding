//
//  PeopleHeaderFooterView.m
//  JKUnfoldingAndFolding
//
//  Created by 王冲 on 2017/10/10.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//  欢迎加入iOS开发交流群 584599353

#import "PeopleHeaderFooterView.h"

@implementation PeopleHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setupItems];
    }
    
    return self;
}

- (void)setupItems{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    /*
     *  头像view的添加
     */
    _smallImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12,16,12, 12)];
    //_iconImageView.backgroundColor = backGayCOLOR;
    [self.contentView addSubview:_smallImageView];
    
    /*
     *  标题的添加
     */
    _biaoTi = [[UILabel alloc]init];
    _biaoTi.x = 40;
    _biaoTi.y = 13;
    _biaoTi.height = 18;
    //_biaoTi.backgroundColor = JKRandomColor;
    _biaoTi.textColor = TitleBlackCOLOR;
    _biaoTi.font = [UIFont systemFontOfSize:16.f];
    _biaoTi.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_biaoTi];
    
    /*
     *  人数
     */
    _smallBiaoTi = [[UILabel alloc]init];
    _smallBiaoTi.x = CGRectGetMaxX(_biaoTi.frame)+8;
    _smallBiaoTi.y = 14;
    _smallBiaoTi.height = 16;
    //_dateText.backgroundColor = JKRandomColor;
    _smallBiaoTi.textColor = TitleTwoBlackCOLOR;
    _smallBiaoTi.textAlignment = NSTextAlignmentLeft;
    _smallBiaoTi.font = [UIFont systemFontOfSize:14.f];
    
    [self.contentView addSubview:_smallBiaoTi];
    
    /*
     * 横线
     */
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(40, 44.5, JKWIDTH-40-14, 0.5)];
    _lineView.backgroundColor = backGayCOLOR;
    [self.contentView addSubview:_lineView];
    
    UIButton *buttonhead = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, JKWIDTH, 45)];
    [buttonhead addTarget:self action:@selector(clickheadHeaderInSection) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:buttonhead];
    
}

-(void)clickheadHeaderInSection{
    
    self.sectionModel.isExpanded = !self.sectionModel.isExpanded;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        if (!self.sectionModel.isExpanded) {
            
            self.smallImageView.transform = CGAffineTransformIdentity;
            
        }else{
            
            self.smallImageView.transform = CGAffineTransformMakeRotation(M_PI);
        }
        
    }];
    
    if (self.schoolhead) {
        
        self.schoolhead(self.sectionModel.isExpanded);
    }
    
    
    
}

- (void)setSectionModel:(JKPeopleModel *)sectionModel{
    
    _sectionModel = sectionModel;
    
    _smallImageView.image = [UIImage imageNamed:@"unfold_gary"];
    
    self.biaoTi.text = _sectionModel.sectionTitle;
    CGFloat bigWidth = [JKwideHighSize string:self.biaoTi.text sizeWithFont:[UIFont systemFontOfSize:16.f] maxSize:CGSizeMake(JKWIDTH-32, 20)].width;
    self.biaoTi.width = bigWidth;
    
    if ([_sectionModel.sectionNumber2 isEqualToString:@"0"]) {
        
        self.smallBiaoTi.attributedText = [self protocolIsSelect:_sectionModel.sectionNumber withColor:TitleTwoBlackCOLOR nickname:_sectionModel.sectionNumber2];
        
    }else{
        
        self.smallBiaoTi.attributedText = [self protocolIsSelect:_sectionModel.sectionNumber withColor:zhuBlueCOLOR nickname:_sectionModel.sectionNumber2];
    }
    
    
    self.smallBiaoTi.x = 40+bigWidth+8;
    self.smallBiaoTi.width = JKWIDTH - 40-bigWidth-8-14;
    
    if (!_sectionModel.isExpanded) {
        
        self.smallImageView.transform = CGAffineTransformIdentity;
        
    }else{
        
        self.smallImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
}

- (NSMutableAttributedString *)protocolIsSelect:(NSString *)str withColor:(UIColor *)color nickname:(NSString *)name{
    
    NSString *str1 = @"(";
    NSString *hintStr = [NSString stringWithFormat:@"%@%@%@",str1,name,str];
    NSString *author1 = [NSString stringWithFormat:@"%@",str1];
    NSString *author = [NSString stringWithFormat:@"%@",name];
    NSString *lastStr = [NSString stringWithFormat:@"%@",str];
    
    NSRange authrange1 = [hintStr rangeOfString:author1];
    NSRange authrange = [hintStr rangeOfString:author];
    NSRange authrangeLast = [hintStr rangeOfString:lastStr];
    
    NSMutableAttributedString *attributehintStr = [[NSMutableAttributedString alloc]initWithString:hintStr];
    
    [attributehintStr addAttribute:NSForegroundColorAttributeName value:TitleTwoBlackCOLOR range:authrange1];
    [attributehintStr addAttribute:NSForegroundColorAttributeName value:color range:authrange];
    [attributehintStr addAttribute:NSForegroundColorAttributeName value:TitleTwoBlackCOLOR range:authrangeLast];
    
    return attributehintStr;
}


@end
