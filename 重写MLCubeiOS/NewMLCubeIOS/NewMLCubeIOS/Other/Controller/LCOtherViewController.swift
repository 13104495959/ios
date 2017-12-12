//
//  OtherViewController.swift
//  NewMLCubeIOS
//
//  Created by 宫赫 on 2017/12/11.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

/// 其他的控制器 tabBar1
class LCOtherViewController: LCViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.red
        
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
        
        let mainTableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        mainTableView.backgroundColor = UIColor.blue
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
}

extension LCOtherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 8
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "LCOtherTableViewCell")
        
    }
  
}
