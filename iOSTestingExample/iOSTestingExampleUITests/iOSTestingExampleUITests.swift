//
//  iOSTestingExampleUITests.swift
//  iOSTestingExampleUITests
//
//  Created by Ewa Bielska on 02.06.2016.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import XCTest

class iOSTestingExampleUITests: XCTestCase {

    let app = XCUIApplication()
    let testAnswear = "Because I am paid"

    override func setUp() {
        super.setUp()

        app.launch()
        continueAfterFailure = false
        XCUIDevice.shared().orientation = .portrait
    }
    
    override func tearDown() {
        super.tearDown()
    }


    //MARK: Tests
    
    func testEnterAnswearAndTapButtonSendAnswear() {
        
        // Check if elements exist
        XCTAssertTrue(app.textFields["answearTextField"].exists)
        XCTAssertTrue(app.buttons["sendButton"].exists)

        // Enter answear and tap send button
        app.textFields["answearTextField"].tap()
        app.textFields["answearTextField"].typeText(testAnswear)
        app.buttons["sendButton"].tap()
    }

    func testAfterEnteringAnswearAndTappingButtonSendAnswearTextFieldShouldBeEmpty() {

        // Wait for elements
        self.waitForElement(app.textFields["answearTextField"])
        self.waitForElement(app.textFields["answearTextField"])

        // Enter answear and tap send button
        app.textFields["answearTextField"].tap()
        app.textFields["answearTextField"].typeText(testAnswear)
        app.buttons["sendButton"].tap()

        // Assert if text field is empty
        XCTAssertNil(app.textFields["answearTextField"].accessibilityValue)
    }

    
    //MARK: Helper method

    fileprivate func waitForElement(_ element: XCUIElement) {

        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
}
