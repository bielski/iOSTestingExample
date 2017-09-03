//
//  iOSTestingExampleUnitTests.swift
//  iOSTestingExample
//
//  Created by Ewa Bielska on 05/06/16.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import Foundation
import XCTest

class iOSTestingExampleUnitTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test() {
        XCTAssertNotNil(UIStoryboard(name: "Main", bundle:nil))
    }
    
    func performanceTest() {
        self.measure {
            NSLog("Hello world!")
        }
    }
}
