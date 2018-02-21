// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyAwesomeProject",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
        /*
         .Package(
         url: "https://github.com/PerfectlySoft/Perfect-PostgreSQL.git",
         majorVersion: 3
         )
         坑,坑,坑,坑,坑,坑,坑
         以上内容是github上写的,但是会运行报错,应该修改为以下内容
         */
        .package(
            url: "https://github.com/PerfectlySoft/Perfect-PostgreSQL.git",
            from: "3.0.0"
        ),
        .package(
            url: "https://github.com/PerfectlySoft/Perfect-Turnstile-PostgreSQL.git",
            from: "3.0.0"
        ),
        .package(
            url: "https://github.com/PerfectlySoft/Perfect-RequestLogger.git",
            from: "3.0.0"
        ),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        /*
         
         注意必须添加PerfectPostgreSQL,才能正常使用
         坑,坑,坑,坑,坑,坑,坑
         github上面根本没写
         
         */
        .target(
            name: "MyAwesomeProject",
            dependencies: ["PerfectHTTPServer", "PerfectPostgreSQL"]),
    ]
)
