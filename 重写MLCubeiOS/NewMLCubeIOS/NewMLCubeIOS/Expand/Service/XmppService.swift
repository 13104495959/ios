//
//  XmppService.swift
//  NewMLCubeIOS
//
//  Created by 宫赫 on 2017/12/14.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

/// XMPP的服务类
class XmppService: NSObject {
    
    /// XMPP服务类单例
    static let sharedInstance = XmppService()
    
    private override init() {
        
        super.init()
//        添加自己作为XMPPStream的代理
        xmppStream.addDelegate(self, delegateQueue: DispatchQueue.main)
        
    }
    
    /// XMPP流
    let xmppStream = XMPPStream()
    
    /// 主机名。管理员选择服务器后确定
    let hostName = "cube.local"
    
    /// 端口号。默认为5222
    let hostPort = 5222
    
    

//    func setNetWork() {
//        
//        xmppStream.myJID = XMPPJID(user: <#T##String?#>, domain: <#T##String#>, resource: <#T##String?#>)
//        
//    }

}
