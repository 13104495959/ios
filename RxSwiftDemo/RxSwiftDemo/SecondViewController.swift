//
//  SecondViewController.swift
//  RxSwiftDemo
//
//  Created by 宫赫 on 2018/2/6.
//  Copyright © 2018年 宫赫. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import SnapKit

class SecondViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        creatUI()
        
        let userNameValod = nameTextField.rx.text.orEmpty.map {
            
            $0.count > 5
            
//            let a = $0.count > 5
//
//
//            print($0.count > 5)
            

        }.share(replay: 1)
     
        userNameValod.bind(to: passWordTextField.rx.isEnabled).disposed(by: disposeBag)
        
        print(userNameValod)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func creatUI() {
        
        view.addSubview(namelabel)
        view.addSubview(nameTextField)
        view.addSubview(nameAlertLabel)
        view.addSubview(passWordLabel)
        view.addSubview(passWordTextField)
        view.addSubview(passWordAlertLabel)
        view.addSubview(sendButton)
        
        namelabel.snp.remakeConstraints { (make) in
            
            make.left.right.equalTo(view)
            make.height.equalTo(40)
            make.top.equalTo(view).offset(66)
            
        }
        
        nameTextField.snp.remakeConstraints { (make) in
            
            make.left.right.equalTo(view)
            make.height.equalTo(40)
            make.top.equalTo(namelabel.snp.bottom)
        }
        
        nameAlertLabel.snp.remakeConstraints { (make) in
            
            make.left.right.equalTo(view)
            make.height.equalTo(40)
            make.top.equalTo(nameTextField.snp.bottom)
            
        }
        
        passWordLabel.snp.remakeConstraints { (make) in
            
            make.left.right.equalTo(view)
            make.height.equalTo(40)
            make.top.equalTo(nameAlertLabel.snp.bottom)
            
        }
        
        passWordTextField.snp.remakeConstraints { (make) in
            
            make.left.right.equalTo(view)
            make.height.equalTo(40)
            make.top.equalTo(passWordLabel.snp.bottom)
            
        }
        
        passWordAlertLabel.snp.remakeConstraints { (make) in
            
            make.left.right.equalTo(view)
            make.height.equalTo(40)
            make.top.equalTo(passWordTextField.snp.bottom)
            
        }
        
        sendButton.snp.remakeConstraints { (make) in
            
            make.left.right.equalTo(view)
            make.height.equalTo(40)
            make.top.equalTo(passWordAlertLabel.snp.bottom)
            
        }
        
    }
    
    private let namelabel: UILabel = {
        
        let namelabel = UILabel()
        namelabel.text = "UserName"
        
        return namelabel
    }()
    
    private let nameTextField: UITextField = {
        
        let nameTextField = UITextField()
        nameTextField.placeholder = "请输入名字"
        
        return nameTextField
    }()
    
    private let nameAlertLabel: UILabel = {
        
        let nameAlertLabel = UILabel()
        nameAlertLabel.text = "请输入5个以上的名字"
        nameAlertLabel.textColor = UIColor.red
        
        return nameAlertLabel
    }()
    
    private let passWordLabel: UILabel = {
        
        let passWordLabel = UILabel()
        passWordLabel.text = "PassWord"
        
        return passWordLabel
    }()
 
    private let passWordTextField: UITextField = {
        
        let passWordTextField = UITextField()
        passWordTextField.placeholder = "请输入密码"
        
        return passWordTextField
    }()
    
    private let passWordAlertLabel: UILabel = {
        
        let passWordAlertLabel = UILabel()
        passWordAlertLabel.text = "请输入5个以上的密码"
        passWordAlertLabel.textColor = UIColor.red
        
        return passWordAlertLabel
    }()

    private let sendButton: UIButton = {
        
        let sendButton = UIButton()
        sendButton.setTitle("可以登录", for: UIControlState.normal)
        sendButton.backgroundColor = UIColor.green
        
        return sendButton
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
