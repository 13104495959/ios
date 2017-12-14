//
//  LCOtherTableVIewHeader.swift
//  NewMLCubeIOS
//
//  Created by 宫赫 on 2017/12/13.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

/// 其他界面自定义的headerView
class LCOtherTableViewHeaderView: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        creatUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func creatUI() {
        
        addSubview(currentView)
        currentView.snp.remakeConstraints { (make) in
            
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.bottom.equalTo(self)
            make.right.equalTo(self)
            
        }
        
    }
    
    private lazy var currentView: UIView = {
        
        let currentView = UIView()
        currentView.backgroundColor = UIColor.red
        
        return currentView
        
    }()
    
}
