//
//  ViewController.h
//  JKUnfoldingAndFolding
//
//  Created by 王冲 on 2017/10/10.
//  Copyright © 2017年 希爱欧科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,retain)NSMutableArray *selectdataArray1;

@property(nonatomic,retain)NSMutableArray *selectdataArray2;

@property(nonatomic,strong) void(^selectPeople)(NSArray *array,NSArray *array1);

/*
 *  学校的ID
 */
@property(nonatomic,strong) NSString *lectureServiceID1;

/*
 *  服务的ID
 */
@property(nonatomic,strong) NSString *contractID1;


@end

