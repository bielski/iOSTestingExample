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
        XCUIDevice.sharedDevice().orientation = .Portrait
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
        app.textFields["answearTextField"].tap()
        app.textFields["answearTextField"].typeText(testAnswear)
        
        // Tap send button
        app.buttons["sendButton"].tap()

        // Assert if text field accessibilityValue is nil
        XCTAssertTrue(app.textFields["answearTextField"].label == "")
    }
}
