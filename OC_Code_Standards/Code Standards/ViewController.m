//
//  ViewController.m
//  Code Standards
//
//  Created by 宫赫 on 2017/3/16.
//  Copyright © 2017年 宫赫. All rights reserved.
//

#import "ViewController.h"

/**
    注释的头文件
 */
#import "GH_Annotation.h"

/**
    当前显示的控制器
 */
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *showTableView;

@end

@implementation ViewController

#pragma mark – Life Cycle (声明周期)

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //  当输入GH_Annotation的时候出现"这是一个注释说明的类"的提示
    
    //  .nameLabel的时候出现"这是一个在.h中声明的显示姓名的nameLabel"的提示
    [GH_Annotation new].nameLabel.text = @"这是一个在.h中声明的显示姓名的nameLabel";
    
    //  run的时候出现"这是一个在.h中声明的跑的方法"的提示
    [[GH_Annotation new] run];
    
    //  空格的演示说明
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    showView.backgroundColor = [UIColor redColor];
    [self.view addSubview:showView];
    
    UILabel *showLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    showLabel.text = @"我是测试一行空格的";
    [self.view addSubview:showLabel];
    
    UIButton *showButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    showButton.backgroundColor = [UIColor redColor];
    [showButton addTarget:self action:@selector(payButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
    
}

#pragma mark - Events (事件)
- (void) payButtonDidClick{
    
    NSLog(@"购买按钮被点击了");
    
}
#pragma mark - UITableViewDataSource (系统的代理)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [[UITableViewCell alloc] init];
    
}

#pragma mark - UITableViewDelegate (系统的代理)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

#pragma mark - Custom Delegates (自己的代理)


#pragma mark – Getters and Setters  (懒加载同时初始化)

- (UITableView *)showTableView{
    
    if (_showTableView == nil) {
        
        _showTableView = [[UITableView alloc] init];
        _showTableView.backgroundColor = [UIColor grayColor];
        
    }
    
    return _showTableView;
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
