//
//  ViewController.swift
//  XmppInstallTest
//
//  Created by 宫赫 on 2017/12/14.
//  Copyright © 2017年 宫赫. All rights reserved.
/*
 
 SWIFT4.0--使用carthage导入XMPP框架问题
 
 1    dyld: Library not loaded: @rpath/XMPPFramework.framework/XMPPFrameworkSwift
 Referenced from: /Users/gonghe/Library/Developer/CoreSimulator/Devices/2DCD44C0-5741-449C-8A6F-0AAF4C9F3962/data/Containers/Bundle/Application/348897D7-499E-475C-92AA-CE12E3D6D9C1/XmppInstallTest.app/XmppInstallTest
 Reason: image not found
 
 在脚本中没有写入$(SRCROOT)/Carthage/Build/iOS/XMPPFramework.framework
 
 
 2    This app could not be installed at this time.
 
 在脚本中写入了$(SRCROOT)/Carthage/Build/iOS/XMPPFrameworkSwift.framework
 
 3    注意 XMPPFrameworkSwift.framework 这个框架千万不要导入,就当没有他好了
 
 在脚本中导入,会报This app could not be installed at this time.
 
 在Linkde FrameWorks and libraries 导入,会报 dyld: Library not loaded: @rpath/XMPPFramework.framework/XMPPFrameworkSwift
 Referenced from: /Users/gonghe/Library/Developer/CoreSimulator/Devices/2DCD44C0-5741-449C-8A6F-0AAF4C9F3962/data/Containers/Bundle/Application/348897D7-499E-475C-92AA-CE12E3D6D9C1/XmppInstallTest.app/XmppInstallTest
 Reason: image not found,所以这个XMPPFrameworkSwift.framework,千万不要导入
 
 4    Linkde FrameWorks and libraries
 共计8个
 
 Build Phases—> Run Script
 共计6个
 
 

 
 */

import UIKit
import XMPPFrameworkSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        view.backgroundColor = UIColor.red
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

