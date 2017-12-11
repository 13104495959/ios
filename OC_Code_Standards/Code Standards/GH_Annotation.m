//
//  GH_Annotation.m
//  Code Standards
//
//  Created by abb on 2017/3/16.
//  Copyright © 2017年 宫赫. All rights reserved.
//

#import "GH_Annotation.h"

@interface GH_Annotation()

/**
    这是一个在.m中声明的显示年龄的ageLabel
 */
@property (strong, nonatomic) UILabel *ageLabel;

@end

@implementation GH_Annotation



#pragma -mark   这是跑的方法
- (void) run{
    
    //  code的时候出现"这是一个在.m中声明的写代码的方法"的提示
    [self code];
    
    //  _ageLabel的时候出现"这是一个在.m中声明的显示年龄的ageLabel"的提示
    _ageLabel.text = @"这是一个在.m中声明的显示年龄的ageLabel";
    
    
    
}


#pragma -mark   这是写代码的方法
/**
    这是一个在.m中声明的写代码的方法
 */
- (void) code{
    
    
    
}

@end
