//
//  iOSTestingExampleTests.swift
//  iOSTestingExampleTests
//
//  Created by ewa on 02.06.2016.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import iOSTestingExample

class iOSTestingExampleSnapshotTests: FBSnapshotTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test uses FBSnapshotVerifyView function
    // available within FBSnapshotTestCase pod to test the view
    
    func testMainViewController() {
        let view = mainView()

        FBSnapshotVerifyView(view)
    }
}
