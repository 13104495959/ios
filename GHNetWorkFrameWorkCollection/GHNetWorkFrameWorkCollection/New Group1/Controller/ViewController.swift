//
//  ViewController.swift
//  GHNetWorkFrameWorkCollection
//
//  Created by 宫赫 on 2017/12/21.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit

import AlamofireObjectMapper


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.red
        
        let provider = MoyaProvider<MyService>()

        
        
        provider.request(MyService.quit) { (json) in
            
            let weatherResponse = json.value
//            print(weatherResponse)
           
            
//            if let threeDayForecast = weatherResponse?.threeDayForecast {
//                for forecast in threeDayForecast {
//                    print(forecast.day)
//                    print(forecast.temperature)
//                }
//            }
            
        }
        
//        provider.rx.request(MyService.quit)
//            .filterSuccessfulStatusCodes()
//            .mapJSON()
//            .subscribe(onNext: { (json) in
//                //do something with posts
//                print(json)
//            })
//            .addDisposableTo(disposeBag)
        
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(URL).responseObject { (response: DataResponse<WeatherResponse>) in
            
//            print(response)
//
//            print(response)
//
//            let weatherResponse = response.result.value
//
//            print(response.result)
//
//            print(response.result.value)
//
//            print(weatherResponse?.location)
            
//            if let threeDayForecast = weatherResponse?.threeDayForecast {
//                for forecast in threeDayForecast {
//                    print(forecast.day)
//                    print(forecast.temperature)
//                }
//            }
        }
        
        
        provider.rx.request(MyService.quit).filterSuccessfulStatusCodes().mapJSON().subscribe(onSuccess: { (json) in
             print(json)
            
           print(json)
            
            let ff = Mapper<WeatherResponse>().map(JSONObject: json)
            
            if let threeDayForecast = ff?.threeDayForecast {
                                for mo in threeDayForecast {
                                    print(mo.day ?? nil ?? "11")
                                    print(mo.temperature ?? "22" as Any)
                                }
                            }
            
            print(ff)
            
//            let weatherResponse = json.
//            print(weatherResponse?.location)
//
//            if let threeDayForecast = weatherResponse?.threeDayForecast {
//                for forecast in threeDayForecast {
//                    print(forecast.day)
//                    print(forecast.temperature)
//                }
//            }
            
            
        }) { (json) in
            
        }
        
        provider.rx.request(MyService.quit).subscribe(onSuccess: { (json) in
            
            
            
        }) { (json) in
            
            
            
        }
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

