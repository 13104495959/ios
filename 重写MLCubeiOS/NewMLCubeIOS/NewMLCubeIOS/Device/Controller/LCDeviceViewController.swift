//
//  DeviceViewController.swift
//  NewMLCubeIOS
//
//  Created by 宫赫 on 2017/12/11.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

/// 设备的控制器 tabbar0
class LCDeviceViewController: LCViewController {

    let xmpp = XMPPStream()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.green
        
    
        
//        let memoryRealm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "CubeInMemoryRealm"))
        
        
        // Do any additional setup after loading the view.
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
