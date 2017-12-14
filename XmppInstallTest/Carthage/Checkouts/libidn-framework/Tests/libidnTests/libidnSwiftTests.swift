//
//  libidnSwiftTests.swift
//  libidn
//
//  Created by Chris Ballinger on 2/22/17.
//  Copyright © 2017 Chris Ballinger. All rights reserved.
//

import XCTest
import libidn

class libidnSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPrepNode() {
        XCTAssertNotNil(NSString.idn_prepNode("asdf"))
        XCTAssertNil(NSString.idn_prepNode("\n\n\n\n"))
    }
    
}
