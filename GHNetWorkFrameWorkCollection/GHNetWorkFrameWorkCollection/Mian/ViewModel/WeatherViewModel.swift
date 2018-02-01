//
//  WeatherViewModel.swift
//  GHNetWorkFrameWorkCollection
//
//  Created by 宫赫 on 2017/12/22.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewModel: NSObject {
    
    let networkReachabilityManager = NetworkReachabilityManager()
    
    let disposeBag = DisposeBag()

//    检测网络状态(状态切换,)
    
    let provider = MoyaProvider<MoyaService>()
    
    override init() {

        super.init()

    }
    
//    成功的回调Successful
    typealias  SuccessfulClosure = ( (Any) -> ())?
   
//    失败的回调Error
    typealias ErrorClosure = ((Any) -> ())?

    
    func Create(successfulClosure: SuccessfulClosure, errorClosure: ErrorClosure, showView: UIView) {
        
        MBProgressHUD .showAdded(to: showView, animated: true)
        
        if networkReachabilityManager?.isReachable == true{
            
            provider.rx.request(MoyaService.Create(title: "", body: "", userId: 1)).mapJSON().subscribe(onSuccess: { (json) in
                
//                let ff = Mapper<WeatherResponseModel>().map(JSONObject: json)
//
//                if let threeDayForecast = ff?.threeDayForecast {
//                    for mo in threeDayForecast {
//                        print(mo.day ?? nil ?? "11")
//                        print(mo.temperature ?? "22" as Any)
//                    }
//                }
                
                if successfulClosure != nil {
                    
                    successfulClosure!(json)
                    
                    
                }
                
                MBProgressHUD.hide(for: showView, animated: true)
                
                print(json)
                
            }, onError: { (json) in
                
                if errorClosure != nil {
                    
                    errorClosure!(json)
                    
                    
                }
                
                MBProgressHUD.hide(for: showView, animated: true)
                
                print(json)
                
            }).disposed(by: disposeBag)
            
        }else {
            
            print(networkReachabilityManager?.networkReachabilityStatus as Any)
            
        }
        
    }

    
    func quit(successfulClosure: SuccessfulClosure, errorClosure: ErrorClosure, showView: UIView)  {
       
        MBProgressHUD .showAdded(to: showView, animated: true)
        
        if networkReachabilityManager?.isReachable == true{
          
            provider.rx.request(MoyaService.quit).mapJSON().subscribe(onSuccess: { (json) in

                let ff = Mapper<WeatherResponseModel>().map(JSONObject: json)
                
                if let threeDayForecast = ff?.threeDayForecast {
                    for mo in threeDayForecast {
                        print(mo.day ?? nil ?? "11")
                        print(mo.temperature ?? "22" as Any)
                    }
                }

                if successfulClosure != nil {

                    successfulClosure!(ff as Any)


                }
                
                MBProgressHUD.hide(for: showView, animated: true)
                
                print(json)

            }, onError: { (json) in
                
                if errorClosure != nil {

                    errorClosure!("fff" as Any)


                }

                MBProgressHUD.hide(for: showView, animated: true)
                
                print(json)

            }).disposed(by: disposeBag)
            
        }else {
            
            print(networkReachabilityManager?.networkReachabilityStatus as Any)
            
        }
    
    }
    
    
    
    
    
    func tagQueryOwner(successfulClosure: SuccessfulClosure, errorClosure: ErrorClosure, showView: UIView) {
        
        MBProgressHUD .showAdded(to: showView, animated: true)
        
        if networkReachabilityManager?.isReachable == true{

//            provider.request(MoyaService.tagQueryOwner(pageNum: "3", pageSize: "2",  ownerName: "", ownerId: "", startDate: "2017-04-04 12:31:14", endDate: ""), completion: { (json) in
//
//                print(json)
//
//                print(json)
//
//            })
        
            provider.rx.request(MoyaService.tagQueryOwner(pageNum: "3", pageSize: "2",  ownerName: "", ownerId: "", startDate: "2017-04-04 12:31:14", endDate: "")).mapJSON().subscribe(onSuccess: { (json) in
                
                //                let ff = Mapper<WeatherResponseModel>().map(JSONObject: json)
                //
                //                if let threeDayForecast = ff?.threeDayForecast {
                //                    for mo in threeDayForecast {
                //                        print(mo.day ?? nil ?? "11")
                //                        print(mo.temperature ?? "22" as Any)
                //                    }
                //                }
                
                if successfulClosure != nil {
                    
                    successfulClosure!(json)
                    
                    
                }
                
                MBProgressHUD.hide(for: showView, animated: true)
                
                print(json)
                
            }, onError: { (json) in
                
                if errorClosure != nil {
                    
                    errorClosure!(json)
                    
                    
                }
                
                MBProgressHUD.hide(for: showView, animated: true)
                
                print(json)
                
            }).disposed(by: disposeBag)
            
        }else {
            
            print(networkReachabilityManager?.networkReachabilityStatus as Any)
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
