//
//  OtherViewController.swift
//  NewMLCubeIOS
//
//  Created by 宫赫 on 2017/12/11.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

/// 点击了哪个tableViewCell
///
/// - zero: 0
/// - one: 1
/// - two: 2
/// - three: 3
/// - four: 4
/// - five: 5
/// - six: 6
/// - seven: 7
enum SelectCell: Int {
    
    case zero = 0, one, two, three, four, five, six, seven
}

/// 其他的控制器 tabBar1
class LCOtherViewController: LCViewController {
    
    let titleModel = ["标签管理","卡管理","用户","用户组","角色","终端","设备日志","警报日志"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.gray
        
        creatUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func creatUI() {
        
        view.addSubview(mainTableView)
        
    }
    
    private lazy var mainTableView: UITableView = {
        
        let mainTableView = UITableView(frame: kSCREEN_BOUNDS, style: UITableViewStyle.grouped)
        mainTableView.backgroundColor = UIColor.blue
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(LCOtherTableViewCell.self, forCellReuseIdentifier: "LCOtherTableViewCell")
        mainTableView.register(LCOtherTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "LCOtherTableViewHeaderView")
        mainTableView.register(LCOtherTableViewFooterView.self, forHeaderFooterViewReuseIdentifier: "LCOtherTableViewFooterView")
        
        
        return mainTableView
        
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

extension LCOtherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 20
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 50
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectCellIndexPathSection = indexPath.section
        
        switch selectCellIndexPathSection {
            
        case SelectCell.zero.rawValue:
            
            print("0000000")
            
        case SelectCell.one.rawValue:
            
            print("1111111")
            
        case SelectCell.two.rawValue:
            
            print("2222222")
            
        case SelectCell.three.rawValue:
            
            print("3333333")
            
        case SelectCell.four.rawValue:
            
            print("4444444")
            
        case SelectCell.five.rawValue:
            
            print("5555555")
            
        case SelectCell.six.rawValue:
            
            print("6666666")
            
        case SelectCell.seven.rawValue:
            
            print("7777777")
            
        default:
            
            return
            
        }
        
    }
    
}

extension LCOtherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 8
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LCOtherTableViewHeaderView")
      
        return view
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LCOtherTableViewFooterView")
      
        return view
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LCOtherTableViewCell") as! LCOtherTableViewCell
       
        cell.setCellWithModel(model: titleModel, currentIndexPath: indexPath)
    
        return cell
        
    }
  
}
