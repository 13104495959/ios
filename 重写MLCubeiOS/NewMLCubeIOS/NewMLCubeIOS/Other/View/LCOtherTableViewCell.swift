//
//  LCOtherTableViewCell.swift
//  NewMLCubeIOS
//
//  Created by 宫赫 on 2017/12/12.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

/// 其他界面自定义cell
class LCOtherTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        creatUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellWithModel(model: [String] , currentIndexPath: IndexPath) {
        
        titleLabel.text = model[currentIndexPath.section]
        
    }
    
    private func creatUI() {
        
        addSubview(leftImageView)
        leftImageView.snp.remakeConstraints { (make) in
            
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(kSNP_20)
            make.size.equalTo(CGSize(width: 30, height: 30))
            
        }
        
        addSubview(titleLabel)
        titleLabel.snp.remakeConstraints { (make) in
        
            make.centerY.equalTo(leftImageView)
            make.left.equalTo(leftImageView.snp.right).offset(kSNP_20)
        
        }
        
        addSubview(rightImageView)
        rightImageView.snp.remakeConstraints { (make) in
            
            make.centerY.equalTo(leftImageView)
            make.right.equalTo(self).offset(-kSNP_20)
            make.size.equalTo(CGSize(width: 10, height: 10))
            
        }
        
    }
    
    private lazy var leftImageView: UIImageView = {
        
        let leftImageView = UIImageView()
        leftImageView.backgroundColor = UIColor.green
        
        
        return leftImageView
        
    }()
    
    private lazy var titleLabel: UILabel = {
    
        let titleLabel = UILabel()
        titleLabel.text = "标题"
        
        return titleLabel
        
    }()
    
    private lazy var rightImageView: UIImageView = {
        
        let rightImageView = UIImageView()
        rightImageView.backgroundColor = UIColor.yellow
        
        return rightImageView
        
    }()

}
