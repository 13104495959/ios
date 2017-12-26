//
//  ExtensionMoya.swift
//  GHNetWorkFrameWorkCollection
//
//  Created by 宫赫 on 2017/12/21.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import Foundation

enum MyService {
    
    case login(name: String, passWord: String)
    case order(time: String, count: String, price: String, id: String)
    case quit
    
}

extension MyService: TargetType {
    
    
   
    /// 请求头,判断测试还是线上,确定使用宏切换还是手动切换
    var baseURL: URL {

        return URL(string: "https://raw.githubusercontent.com")!
        
//        return URL(string: "https://api.myservice.com")!
        
    }
    
    /// API
    var path: String {
        
        switch self {
        case .login( _, _):
            
            return "/posts"
            
        case .order( let time, let count, let price, let id):
            
            return time + count + id + price
            
        case .quit:
            
            return "/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
//            return "/zen"
        }

    }
    
    /// post还是get,可以省略方法参数
    var method: Moya.Method {
        
        switch self {
        case .login,.order:
            
            return .post
            
        case .quit:
            
            return .get
    }
        
    }
    
    /// 测试使用,这个如果不使用测试功能,可直接返回data对象
    var sampleData: Data {
        
        return Data()
        
//        switch self {
//        case .login(name: let name, passWord: let passWord):
//
//            return "{\"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
//
//        case .order(time: let time, count: let count, price: let price, id: let id):
//
//            return "{\"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
//
//        case .quit:
//
//            return "[{\"userId\": \"1\", \"Title\": \"Title String\", \"Body\": \"Body String\"}]".utf8Encoded
//            return"[]".utf8Encoded
//
//    }
        
        }
    
    /// 设置调用的请求方法
    var task: Task {
        
        switch self {
        case .login(let name, let passWord):
            print(name,passWord)
            return .requestParameters(parameters: ["user_name" : name, "user_passWord" : passWord], encoding: JSONEncoding.default)
            
        case .order(let time, let count, let price, let id):
            
            return .requestParameters(parameters: ["user_time" : time, "user_count" : count, "user_price" : price, "user_id" : id], encoding: URLEncoding.queryString)
            
        case .quit:
            
            return .requestPlain
        }
        
        }
    
    /// 设置解析类型
    var headers: [String : String]? {
        
        return ["Content-type": "application/json"]
        
    }



}
  
// MARK: - Helpers  私有扩展
private extension String {

    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

