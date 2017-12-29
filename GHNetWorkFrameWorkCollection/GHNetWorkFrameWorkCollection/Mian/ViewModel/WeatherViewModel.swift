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
}
