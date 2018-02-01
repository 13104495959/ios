//
//  ExtensionMoya.swift
//  GHNetWorkFrameWorkCollection
//
//  Created by 宫赫 on 2017/12/21.
//  Copyright © 2017年 宫赫. All rights reserved.
//

import Foundation

enum MoyaService {
    
    case login(name: String, passWord: String)
    case order(time: String, count: String, price: String, id: String)
    case quit
    case curAppVer
    case createUser(firstName: String, lastName: String)
    
    case Create(title: String, body: String, userId: Int)
    
    case tagQueryOwner(pageNum: String, pageSize: String, ownerName: String, ownerId: String, startDate: String, endDate: String)

    
}

extension MoyaService: TargetType {
    
    
   
    /// 请求头,判断测试还是线上,确定使用宏切换还是手动切换
    var baseURL: URL {

        return URL(string: "https://raw.githubusercontent.com")!
        
//        return URL(string: "https://api.myservice.com")!
        
//        return URL(string: "http://www.BaseURL.com")!
        
        
//        return URL(string: "http://10.0.1.17:8080")!
        
//        return URL(string: "http://jsonplaceholder.typicode.com")!
        
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
        case .curAppVer:
            return "/curAppVer"
        case .createUser(_, _):
            return "/users"
            
            
        case .Create(_, _, _):
            return "/posts"
            
        case .tagQueryOwner(_, _, _, _, _, _):
            
            return "/mirrorlife/tag!queryOwner.sv"
            
            
            
            
        }

    }
    
    /// post还是get,可以省略方法参数
    var method: Moya.Method {
        
        switch self {
        case .login,.order, .curAppVer,.createUser, .tagQueryOwner(_, _, _, _, _, _):
            
            return .post
            
        case .quit:
            
            return .get
            
        case .Create(_, _, _):
            return .post
        
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
            
        case .tagQueryOwner(let pageNum, let pageSize, let ownerId, let ownerName, let startDate, let endDate):
            
            print(pageNum + pageSize + ownerId + ownerName + startDate + endDate)
            
            let user = ["pageNum" : pageNum, "pageSize" : pageSize, "ownerId" : ownerId, "ownerName" : ownerName,  "startDate" : startDate, "endDate" : endDate] as [String : Any]
            
            let data : NSData! = try? JSONSerialization.data(withJSONObject: user, options: []) as NSData
            //NSData转换成NSString打印输出
            let str = NSString(data:data as Data, encoding: String.Encoding.utf8.rawValue)
            //输出json字符串
            print("Json Str:"); print(str as Any)
            
            
            
            return .requestParameters(parameters: ["pageNum" : pageNum, "pageSize" : pageSize, "ownerId" : ownerId, "ownerName" : ownerName,  "startDate" : startDate, "endDate" : endDate], encoding: JSONEncoding.default)
            
            
            
        case .login(let name, let passWord):
            print(name,passWord)
            return .requestParameters(parameters: ["user_name" : name, "user_passWord" : passWord], encoding: JSONEncoding.default)
            
        case .order(let time, let count, let price, let id):
            
            return .requestParameters(parameters: ["user_time" : time, "user_count" : count, "user_price" : price, "user_id" : id], encoding: URLEncoding.queryString)
            
        case .quit:
            
            return .requestPlain
        case .curAppVer:
            
            return .requestPlain
            
        case let .createUser(firstName, lastName): // Always send parameters as JSON in request body
            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
            
//            title: String, body: String, userId: Int
        case .Create(let title, let body, let userId):
            
            return .requestParameters(parameters: ["title": title, "body": body, "userId" : userId], encoding: JSONEncoding.default)
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

