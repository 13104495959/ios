//
//  ViewController.swift
//  WorkTest1
//
//  Created by 宫赫 on 2018/2/9.
//  Copyright © 2018年 宫赫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var model1 = ["旧", "旧", "新", "新", "旧"]
    
    var model2 = [false,false,true,true,false]
    
    var model3 = [false, false, false, false, false]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(currentTableView)
        
    }
    
    private lazy var currentTableView: UITableView = {
        
        let currentTableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        currentTableView.backgroundColor = UIColor.white
        currentTableView.delegate = self
        currentTableView.dataSource = self
        currentTableView.register(WorkTestTableViewCell.self, forCellReuseIdentifier: "WorkTestTableViewCell")
        
        return currentTableView
    }()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model1.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkTestTableViewCell") as! WorkTestTableViewCell
        cell.setCellWithModel(model1: model1, model2: model2, model3: model3, currentIndexPath: indexPath)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        model1.remove(at: indexPath.row)
        model2.remove(at: indexPath.row)
        model3.remove(at: indexPath.row)
        
        
        model1.insert("新的tag", at: 0)
        model2.insert(true, at: 0)
        model3.insert(true, at: 0)
        
        currentTableView.reloadData()
        
    }
    
}

