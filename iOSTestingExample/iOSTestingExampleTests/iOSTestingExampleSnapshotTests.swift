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
        self.deviceAgnostic = true
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: Simple test of main view controller
    func testMainViewController() {
        let view = mainView()

        FBSnapshotVerifyView(view)
    }

    // MARK: Test uses performTestViewOnFourPlatformsWithoutAccessibilityInPortraitAndLandscapeWithView function
    // to test view on four devices in both orientations (but without different font sizes)
    func testMainViewControllerWithoutAccessibility() {
        let view = mainView()
    performTestViewOnFourPlatformsWithoutAccessibilityInPortraitAndLandscapeWithView(view, height: Double(iPhone5Height))
    }
    
    // MARK: Test uses performTestViewOnFourPlatformsWithAccessibilityWithView function
    // to test view on four devices in portrait orientation (with different font sizes)
    func testMainViewControllerWithAccessibility() {
        let view = mainView()

        performTestViewOnFourPlatformsWithAccessibilityWithView(view, height: Double(iPhone5Height))
    }
    
    // MARK: Helper
    private func mainView() -> UIView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
        
        return initialViewController!.view;
    }
}
