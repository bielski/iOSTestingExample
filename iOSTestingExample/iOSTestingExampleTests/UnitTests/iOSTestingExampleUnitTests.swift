//
//  iOSTestingExampleUnitTests.swift
//  iOSTestingExample
//
//  Created by Ewa Bielska on 05/06/16.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import Foundation
import XCTest
import Cuckoo
@testable import iOSTestingExample

class MockURLSession: URLSession {
    var dataTaskCallCount = 0
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        return URLSessionDataTask()
    }
}

class iOSTestingExampleUnitTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        sut = ViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK - Mocked tests
    
    // TODO: Fix failing test
//    func testAsynchronousCall() {
//        // Arrange
//        let mockURLSession = MockURLSession()
//
//        // Act
//        sut.callGithub(session: mockURLSession)
//
//        // Assert
//        XCTAssertEqual(mockURLSession.dataTaskCallCount, 1)
//    }
//
//    func testAsynchronousCallUsingCuckoo() {
//        // Arrange
//
//        // Act
//
//        // Assert
//
//    }
    
    // MARK - Performance test
    
    func testPerformance() {
        self.measure {
            NSLog("Hello world!")
        }
    }
}
