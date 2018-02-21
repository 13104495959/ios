//
//  FirstViewController.swift
//  RxSwiftDemo
//
//  Created by 宫赫 on 2018/2/5.
//  Copyright © 2018年 宫赫. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        //发送通知,swift通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FirstViewControllerNotification"), object: self, userInfo: ["FirstViewController" : "FirstViewController"])
    }

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
