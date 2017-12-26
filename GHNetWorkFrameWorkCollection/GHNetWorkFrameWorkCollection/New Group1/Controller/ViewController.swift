//
//  ViewController.swift
//  GHNetWorkFrameWorkCollection
//
//  Created by 宫赫 on 2017/12/21.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let networkReachabilityManager = NetworkReachabilityManager()
    
    let vm = WeatherViewModel()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        vm.quit(successfulClosure: { (json) in
            
            print(json)
            print(json)
            
        }, errorClosure: { (json) in
            
            print(json)
            print(json)
            
        }, showView: self.view)
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(networkReachabilityManager?.isReachable as Any)
     
        if networkReachabilityManager?.isReachable == true {
            
            view.backgroundColor = UIColor.white
            
        }else {
            
            view.backgroundColor = UIColor.red
         
        }
        
        vm.quit(successfulClosure: { (json) in
            
            print(json)
            print(json)
            
        }, errorClosure: { (json) in
            
            print(json)
            print(json)
            
        }, showView: self.view)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

