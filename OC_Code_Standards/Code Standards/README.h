//
//  README.h
//  Code Standards
//
//  Created by 宫赫 on 2017/3/16.
//  Copyright © 2017年 宫赫. All rights reserved.
//

1   UI图片的命名规范及使用规范

    使用英文命名,尽量不使用拼音(这个可以和UI协调下)
    功能分隔使用_,方便查找图片
    图片后缀使用@2x,@3x来标识
    图片统一放在Assets.xcassets中来管理
    禁止录入名字不同内容相同的图片
    使用ImageNamed来加载

    模块_类别_功能_状态(@2x或@3x).png
    tabbar_button_home_normal@2x
    标签栏_按钮_搜索_默认状态 分辨率

    Assets.xcassets文件中有4张图片示例

2   文档

    使用appledocDocoment自动生成HTML文档(如果手写,请忽略)

3   命名方法

    小驼峰命名法：第一个单字以小写字母开始；第二个单字的首字母大写，如：mineTableView
    大驼峰命名法：每一个单字的首字母都采用大写字母，如： MineTableView

4   注释

    /**    这是注释    */     统一使用这种写法(左右4个空格,可使用tab,需要设置好)
        方便appledocDocoment的读取 防止读取错误
        调用时有注释提示
//    swift使用 " /// " 来进行方法注释
    #pragma -mark 可以快速查找方法

    类      在.h文件@interface上面注释,当使用类的时候会有提示

    属性    在.h文件或.m文件,所有属性都必须使用这种规范注释,当你使用属性的时候有提示(在.m文件的属性必须不能使用self.否则不显示提示,切记切记)

    方法    如果.h文件.m文件都使用
                在.h文件中使用     /**    当你使用方法的时候有提示    */
                在.m文件中使用     #pragma -mark 注释

            如果只在.m中使用       先写#pragma -mark 注释 再写/**    当你使用方法的时候有提示    */
5   空格

    所有的内容,只使用一行空格来分隔,相关的代码逻辑不使用空格分隔

6   运算符

    所有的运算符两侧 都需要一个空格

6   类

    命名
    大驼峰命名    前缀_功能描述+类型
    GH_MessageTableViewCell.h

    或者使用
    前缀+功能描述+类型
    GHMessageTableViewCell

    分类（类别）命名 与类命名相同，需添加要扩展的类名和“+” ,NSString+GH_URLEncoding
    也可以使用NSString+GHURLEncoding

    协议（委托）命名 与类命名相同，此外需添加“Delegate”后缀 ,GH_ShowViewDelegate
    也可以使用GHShowViewDelegate

    (主要是为了分隔前缀,所以加了_,方便使用,和苹果的规范不一样)

    头文件布局
    .h文件
    文件头
    #import （依次为标准库头文件、非标准库头文件）
    全局宏
    常量定义
    全局数据类型
    类定义

    .m文件
    #import （依次为标准库头文件、非标准库头文件） 
    文件内部使用的宏
    常量定义
    文件内部使用的数据类型
    全局变量
    本地变量(即静态全局变量）
    类的实现

    方法布局
    #pragma mark – Life Cycle (声明周期)
    #pragma mark - Events (事件)
    #pragma mark – Private Methods (这个不应该写  应该写成分类)
    #pragma mark - UITextFieldDelegate (系统的代理)
    #pragma mark - UITableViewDataSource (系统的代理)
    #pragma mark - UITableViewDelegate (系统的代理)
    #pragma mark - Custom Delegates (自己的代理)
    #pragma mark – Getters and Setters  (懒加载同时初始化)

    方法
方法命名
首字母小写，之后每个单词首字母都大写
方法名使用动词短语
举例：- (void)setPostValue:(int)value

方法参数命名
首字母小写，之后每个单词首字母都大写
具有足够的说明性
不需要添加类型前缀
举例：- (void)sendUserInfo:(NSDictionary *)userInfo




    属性

    小驼峰命名
    全部使用    @property+空格(XXXXX,(空格)XXXX)+空格+类型+空格+属性名
    描述的单词+类型后缀全拼
    @property (strong, nonatomic) UILabel *nameLabel;


    宏
    前面加上小写字母k+全部字母大写

    常量
    前面加上小写字母k+大驼峰命名法
    必须使用const修饰 防止误修改
    static const NSTimeInterval kAnimationDuration = 0.3;


    枚举
    不要使用C的枚举,应该使用OC的枚举
    大驼峰命名,后缀用s结尾
    枚举变量使用枚举类型去掉s作为前缀
    typedef NS_ENUM(NSInteger, GHNetWorkStatus)
    {
        
        GHNetWorkStatuUnknown          = -1,    //  未知网络
        GHNetWorkStatuNotReachable     = 0,     //  没有网络
        GHNetWorkStatuReachableViaWWAN = 1,     //  手机网络(2G 3G 4G)
        GHNetWorkStatuReachableViaWiFi = 2,     //  WiFi
        
    };

    只是一些常用的规范,并不全面,有些是根据项目的实际需求设定的,不一定符合苹果的规范
    全部示例在工程中都可以看见 如有问题联系 QQ 976552711

































