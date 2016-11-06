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
        continueAfterFailure = false
        XCUIApplication().launch()
        XCUIDevice.shared().orientation = .portrait
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: Tests
    
    func testMainViewControllerLayout() {

        // Wait for layout components
        XCTAssertTrue(app.staticTexts["questionLabel"].exists)
        XCTAssertTrue(app.textFields["answearTextField"].exists)
        XCTAssertTrue(app.buttons["sendButton"].exists)
    }
    
    func testAfterEnteringAnswearAndTappingButtonSendAnswearTextFieldShouldBeEmpty() {
        
        // Tap text field and enter text
        let app = XCUIApplication()
        self.waitForElement(app.textFields["answearTextField"])
        self.waitForElement(app.textFields["answearTextField"])
        
        // Tap send button
        app.buttons["sendButton"].tap()

        // Assert if text field accessibilityValue is empty
        XCTAssertTrue(app.textFields["answearTextField"].label.isEmpty)
    }

    //MARK: Helper method

    fileprivate func waitForElement(_ element: XCUIElement) {

        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
}
