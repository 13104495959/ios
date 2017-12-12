//
//  LCTabBarController.swift
//  NewMLCubeIOS
//
//  Created by 宫赫 on 2017/12/11.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

/// UITabBarController的子类,用LCTabBarController代替UITabBarController使用
class LCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        addChildViewControllers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 批量添加子控制器
   private func addChildViewControllers() {
        
        creatChildViewController(childController: LCDeviceViewController(), title: "设备", imageName: "")
        creatChildViewController(childController: LCOtherViewController(), title: "其他", imageName: "")
        creatChildViewController(childController: LCQuitViewController(), title: "退出", imageName: "")
        
    }
    
    /// 初始化子控制器,给控制器添加属性
    ///
    /// - Parameters:
    ///   - childController: 点击LcTabBarController
    ///   - title: tabBarController的每个子控制器的文字
    ///   - imageName: tabBarController的每个控制器的默认图片的名字
   private func creatChildViewController(childController: LCViewController, title: String, imageName: String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: imageName)
        childController.tabBarItem.selectedImage = UIImage.init(named: imageName)
        let navigationController = LCNavigationController(rootViewController: childController)
        addChildViewController(navigationController)
    
    }
    
//    optional public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: -UITabBarControllerDelegate 使用拓展为LCTabBarController增加协议方法
extension LCTabBarController: UITabBarControllerDelegate {

    /// UITabBarControllerDelegate的代理方法,根据Bool值判断是否可以进行控制器的跳转
    ///
    /// - Parameters:
    ///   - tabBarController: 当前的tabBarController
    ///   - viewController: 当前的navigationController,注意不是navigationController的初始化控制器
    /// - Returns: true --> 可以进行控制器的跳转 false --> 不能进行控制器的跳转
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.childViewControllers.first! .isKind(of: LCQuitViewController.self) {
            
            print("退出当前账号,不进行控制器跳转")
            
            return false
            
        }
        
        return true
        
    }
    
    /// UITabBarControllerDelegate的代理方法,点击tabBar控制器可以跳转,才会调用的方法
    ///
    /// - Parameters:
    ///   - tabBarController: 当前的tabBarController
    ///   - viewController: 当前的navigationController,注意不是navigationController的初始化控制器
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
       
    }

}


