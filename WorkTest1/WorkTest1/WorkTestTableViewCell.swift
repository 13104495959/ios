//
//  WorkTestTableViewCell.swift
//  WorkTest1
//
//  Created by 宫赫 on 2018/2/9.
//  Copyright © 2018年 宫赫. All rights reserved.
//

import UIKit

class WorkTestTableViewCell: UITableViewCell {
    
    /// 是否选中
    var selectedStatus = false
    
    /// 新旧tag
    var isNewtag = false
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    private func creatUI() {
        
        self.addSubview(ownerId)
        self.addSubview(timeId)
        
    }
    
    func setCellWithModel(model1: [String], model2: [Bool], model3: [Bool], currentIndexPath: IndexPath) {
        
        ownerId.text = model1[currentIndexPath.row]
        self.isNewtag = model2[currentIndexPath.row]
        self.selectedStatus = model3[currentIndexPath.row]
        if self.isNewtag == false {
            
            self.backgroundColor = UIColor.red
            
        }else {
            
            self.backgroundColor = UIColor.green
            
        }
        
        if self.selectedStatus == false {
            
            timeId.text = "没有被选中,没有被选中,没有被选中,没有被选中,"
            
        }else {
            
            timeId.text = "被选中了"
            
        }
        
    }
    
    private lazy var ownerId: UILabel = {
        
        let ownerId = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 20))
        ownerId.text = "默认的ownerId"
        
        return ownerId
    }()
    
    private lazy var timeId: UILabel = {
        
        let timeId = UILabel(frame: CGRect(x: 20, y: 30, width: 200, height: 20))
        timeId.text = "默认的timeId"
        
        return timeId
    }()
    
}
