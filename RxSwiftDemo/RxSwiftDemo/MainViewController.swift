//
//  MainViewController.swift
//  RxSwiftDemo
//
//  Created by 宫赫 on 2018/2/5.
//  Copyright © 2018年 宫赫. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import SnapKit


/// 注意 需要引入RxSwift和RxCocoa的头文件
class MainViewController: UIViewController {

    let screenWidth = UIScreen.main.bounds.size.width
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        creatUI()
        //rx的通知
    NotificationCenter.default.rx.notification(Notification.Name("FirstViewControllerNotification")).subscribe { (notification) in
            
        print(notification)
        self.rxButton.setTitle(notification.element?.userInfo!["FirstViewController"] as? String, for: UIControlState.normal)
            
        }.disposed(by: disposeBag)
        
        //注册通知.swift通知
        NotificationCenter.default.addObserver(self, selector: #selector(firstViewControllerNotificationClick), name: Notification.Name("FirstViewControllerNotification"), object: nil)
    }
    
    /// swift通知
    ///
    /// - Parameter info: 通知传递的值
    @objc private func firstViewControllerNotificationClick(info: Notification) {
        
        swiftButton.setTitle(info.userInfo!["FirstViewController"] as? String, for: UIControlState.normal)

    }
    
    private func creatUI() {
        
        view.addSubview(swiftButton)
        view.addSubview(rxButton)
        view.addSubview(loginButton)
        
    }
    
    /// swift的按钮的写法
    private lazy var swiftButton: UIButton = {
        
        let swiftButton = UIButton(frame: CGRect(x: 0, y: 66, width: screenWidth, height: 40))
        swiftButton.setTitle("我是swift按钮", for: UIControlState.normal)
        swiftButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        swiftButton.backgroundColor = UIColor.green
        swiftButton.addTarget(self, action: #selector(swiftButtonClick), for: UIControlEvents.touchUpInside)
        
        return swiftButton
    }()
    
    /// swift的按钮的写法
    @objc private func swiftButtonClick() {
         self.navigationController?.pushViewController(FirstViewController(), animated: true)
        
    }
    
    /// rx的按钮的写法
    private lazy var rxButton: UIButton = {
        
        let rxButton = UIButton(frame: CGRect(x: 0, y: 106, width: screenWidth, height: 40))
        rxButton.setTitle("我是rx按钮", for: UIControlState.normal)
        rxButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        rxButton.backgroundColor = UIColor.yellow
        rxButton.rx.tap.subscribe({ (_) in
            //FIXME:参数填什么,为什么填上参数就不能调用方法了
        self.navigationController?.pushViewController(FirstViewController(), animated: true)
            
        }).disposed(by: disposeBag)
        
        return rxButton
    }()
    
    private lazy var loginButton: UIButton = {
        
        let loginButton = UIButton(frame: CGRect(x: 0, y: 146, width: screenWidth, height: 40))
        loginButton.setTitle("登录界面", for: UIControlState.normal)
        loginButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        loginButton.rx.tap.subscribe({ (Void) in
    self.navigationController?.pushViewController(SecondViewController(), animated: true)
            
        }).disposed(by: disposeBag)
        
        return loginButton
    }()


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
