
/*
 
 路由API是PerfectHTTP项目的一部分。与路由系统交互首先需要你import PerfectHTTP
 
 */
import PerfectHTTP
import PerfectHTTPServer
import PerfectPostgreSQL

/// Function which receives request and response objects and generates content.接受请求数据和相应对象并生成内容的函数
public typealias RequestHandler = (HTTPRequest, HTTPResponse) -> ()

/*
 
 路由
 
 路由决定哪个处理程序接收到特定请求。处理程序是专门用于接收和处理某些请求的功能。请求根据两条信息进行
 路由：HTTP请求方法和请求路径。路由是指HTTP方法，路径和处理程序组合。在开始监听请求之前，创建路由并
 将其添加到服务器。
 
 add是添加路由的方法
 
 */

// Register your own routes and handlers,注册你的路由和程序,使用baseUrl初始化路由
var baseURLRoutes = Routes(baseUri: "/userInfo")

baseURLRoutes.add(method: .get, uris: ["/addUserName", "addUserPhoneNumber", "addUserAge", "addUserSex"]) { (request, response) in
    
    //HTTPRequestHeader.Name.contentType,enum可以简写成.contentType
    request.setHeader(HTTPRequestHeader.Name.contentType, value: "text/html")
    
    /*
     
     string 可以直接输入字符串,也可以输入HTML5
     
     response.appendBody(string: "hahahhahahahahahahahahah")
     .completed()
     
     */
    response.appendBody(string: "<html><title>Hello, world!</title><body>HTML5,HTML5,HTML5,HTML5,HTML5,HTML5,HTML5,HTML5,HTML5,HTML5,HTML5</body></html>").completed()
    
}
/*
 
 启动HTTP服务
 
 */
do {
    // Launch the HTTP server.
    try HTTPServer.launch(
        .server(name: "www.example.ca", port: 8888, routes: baseURLRoutes))

} catch {
    fatalError("\(error)") // fatal error launching one of the servers
}


