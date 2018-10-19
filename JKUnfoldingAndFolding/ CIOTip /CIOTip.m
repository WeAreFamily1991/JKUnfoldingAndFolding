//
//  CIOTip.m
//  CIOTimes
//
//  Created by 王冲 on 2017/2/23.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import "CIOTip.h"

@implementation CIOTip

+(void)tishi:(UIViewController *)target withString:(NSString *)str withtype:(NSString *)type
{
    
    long superX  = target.view.bounds.size.width;
    long superY  = target.view.bounds.size.height;
    
    long newX = superX/2 - 75;
    long newY = superY/3;
    
    UILabel *black = [[UILabel alloc]initWithFrame:CGRectMake(newX,newY, 150, 100)];
    black.backgroundColor = [UIColor blackColor];
    black.layer.cornerRadius = 10;
    black.numberOfLines = 0;
    black.clipsToBounds = YES;
    black.alpha = 0;
    
    black.textColor = [UIColor whiteColor];
    [target.view addSubview:black];
    black.text = str;
    black.textAlignment = NSTextAlignmentCenter;
    [UIView animateWithDuration:1 animations:^{
        
        black.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:1 animations:^{
            
            black.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [black removeFromSuperview];
            
            if ([type isEqualToString:@"0"]) {
                

            }
            
            if ([type isEqualToString:@"1"]) {
                
                [target.navigationController popViewControllerAnimated:YES];
                
            }
            
            if ([type isEqualToString:@"2"]) {
                
                 [target.navigationController popToRootViewControllerAnimated:YES];
                
            }
            if ([type isEqualToString:@"3"]) {
                
                
                NSString *str =   [NSString stringWithFormat:@"%lu",target.navigationController.viewControllers.count];
                int number = [str intValue]-3;
                [target.navigationController popToViewController:target.navigationController.viewControllers[number] animated:YES];
                
            }
            
            if ([type isEqualToString:@"4"]) {
                
                [target dismissViewControllerAnimated:YES completion:nil];
                
            }
            
            if ([type isEqualToString:@"5"]) {
                
            [target.navigationController popToViewController:target.navigationController.viewControllers[1] animated:YES];
            }
            
            if ([type isEqualToString:@"6"]) {
                
                [target.navigationController popToViewController:target.navigationController.viewControllers[0] animated:YES];
            }
            
            
            
        }];

    }];
}

+(void)tishi2:(UIViewController *)target withString:(NSString *)str withtype:(NSString *)type
{
    
       CGSize titleSize = [JKwideHighSize string:str sizeWithFont:[UIFont systemFontOfSize:16.f] maxSize:CGSizeMake(144,JKHEIGHT)];
    
    long with = titleSize.width+48;
    
    long height = titleSize.height +60;
    
    long superX  = target.view.bounds.size.width;
    long superY  = target.view.bounds.size.height;
    
    long newX = (superX - with)/2;
    long newY = superY/3;
    
    
    
 
    

    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(newX,newY, with, height)];
     view.clipsToBounds = YES;
     view.layer.cornerRadius = 4;
     view.alpha = 0;
    view.backgroundColor = [UIColor blackColor];
    UILabel *black = [[UILabel alloc]initWithFrame:CGRectMake(24,30, titleSize.width , titleSize.height)];
    
    black.backgroundColor = [UIColor blackColor];
    
    black.numberOfLines = 0;
   
   
    black.font = [UIFont systemFontOfSize:16.f];
    black.textColor = [UIColor whiteColor];
    [view addSubview:black];
    [target.view addSubview:view];
    black.text = str;
    black.textAlignment = NSTextAlignmentCenter;
    [UIView animateWithDuration:1 animations:^{
        
        view.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:1 animations:^{
            
            view.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [view removeFromSuperview];
            
            if ([type isEqualToString:@"0"]) {
                
                
            }
            
            if ([type isEqualToString:@"1"]) {
                
                [target.navigationController popViewControllerAnimated:YES];
                
            }
            
            if ([type isEqualToString:@"2"]) {
                
                [target.navigationController popToRootViewControllerAnimated:YES];
                
            }
            if ([type isEqualToString:@"3"]) {
                
                
                NSString *str =   [NSString stringWithFormat:@"%lu",target.navigationController.viewControllers.count];
                int number = [str intValue]-3;
                [target.navigationController popToViewController:target.navigationController.viewControllers[number] animated:YES];
                
            }
            
            if ([type isEqualToString:@"4"]) {
                
                [target dismissViewControllerAnimated:YES completion:nil];
                
            }
            
            if ([type isEqualToString:@"5"]) {
                
                [target.navigationController popToViewController:target.navigationController.viewControllers[1] animated:YES];
            }
            
            if ([type isEqualToString:@"6"]) {
                
                [target.navigationController popToViewController:target.navigationController.viewControllers[0] animated:YES];
            }
            
            
            
        }];
        
    }];
}


+(void)tishi1:(UIViewController *)target withString:(NSString *)str withtype:(NSString *)type
{
    
    long superX  = target.view.bounds.size.width;
    long superY  = target.view.bounds.size.height;
    
    long newX = superX/2 - 75;
    long newY = superY/3;
    
    UILabel *black = [[UILabel alloc]initWithFrame:CGRectMake(newX,newY, 150, 100)];
    black.backgroundColor = [UIColor blackColor];
    black.layer.cornerRadius = 10;
    black.numberOfLines = 0;
    black.clipsToBounds = YES;
    black.alpha = 0;
    
    black.textColor = [UIColor whiteColor];
    [target.view addSubview:black];
    black.text = str;
    black.textAlignment = NSTextAlignmentCenter;
    [UIView animateWithDuration:1 animations:^{
        
        black.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:1 animations:^{
            
            black.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [black removeFromSuperview];
            
            if ([type isEqualToString:@"0"]) {
                
                
            }
            
            if ([type isEqualToString:@"1"]) {
                
                [target.navigationController popViewControllerAnimated:YES];
                
            }
            
            if ([type isEqualToString:@"2"]) {
                
                [target.navigationController popToRootViewControllerAnimated:YES];
                
            }
            if ([type isEqualToString:@"3"]) {
                
                
                NSString *str =   [NSString stringWithFormat:@"%lu",target.navigationController.viewControllers.count];
                int number = [str intValue]-3;
                [target.navigationController popToViewController:target.navigationController.viewControllers[number] animated:YES];
                
            }
            
            if ([type isEqualToString:@"4"]) {
                
                [target dismissViewControllerAnimated:YES completion:nil];
                
            }
            
            if ([type isEqualToString:@"5"]) {
                
                [target.navigationController popToViewController:target.navigationController.viewControllers[1] animated:YES];
            }
            
            if ([type isEqualToString:@"6"]) {
                
                [target.navigationController popToViewController:target.navigationController.viewControllers[0] animated:YES];
            }
            
            
            
        }];
        
    }];
}




@end
