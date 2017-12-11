//
//  GH_Annotation.h
//  Code Standards
//
//  Created by abb on 2017/3/16.
//  Copyright © 2017年 宫赫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
    这是一个注释说明的类
 */
@interface GH_Annotation : NSObject


/**
    这是一个在.h中声明的显示姓名的nameLabel
 */
@property (strong, nonatomic) UILabel *nameLabel;



/**
    这是一个在.h中声明的跑的方法
 */
- (void) run;



@end
