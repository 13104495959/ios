//
//  TestModel.swift
//  GHNetWorkFrameWorkCollection
//
//  Created by 宫赫 on 2017/12/21.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import UIKit
import ObjectMapper

/// 天气model
class WeatherResponseModel: Mappable {
    var location: String?
    var threeDayForecast: [ForecastModel]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.location <- map["location"]
        
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}

class ForecastModel: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}


