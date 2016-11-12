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
        self.isDeviceAgnostic = true
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

    // MARK: Test uses snapshotTestOnFourPlatforms function
    // to test view on four devices in both orientations and changing system font size
    
    func testMainViewControllerWithAccessibility() {
        let view = mainView()
        snapshotTestOnFourPlatforms(view: view, height: iPhone5Height, withAccessibility: true, inBothOrientations: true)
    }
    
    // MARK: Test uses snapshotTestOnFourPlatforms function
    // to test view on four devices in one orientation and one font size
    
    func testMainViewControllerWithoutAccessibility() {
        let view = mainView()
        snapshotTestOnFourPlatforms(view: view, height: iPhone5Height)
    }

    func testAnswerLabelWithoutAccessibility() {
        let vc = viewController()
        _ = vc.view
        let view = vc.answerTextField!
        view.text = "test answer"
        snapshotTestOnFourPlatforms(view: view, height: view.frame.size.height)
    }
    
    // MARK: Helper
    fileprivate func viewController() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateInitialViewController() as! ViewController
    }


    fileprivate func mainView() -> UIView {
        
        return viewController().view
    }
}
