//
//  iOSTestingExampleUITests.swift
//  iOSTestingExampleUITests
//
//  Created by ewa on 02.06.2016.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import XCTest

class iOSTestingExampleUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    let app = XCUIApplication()
    
    func testMainViewControllerLayout() {

        XCTAssertTrue(app.images["wrotQA-logo"].exists)
        XCTAssertTrue(app.staticTexts["questionLabel"].exists)
        XCTAssertTrue(app.textFields["answearTextField"].exists)
        XCTAssertTrue(app.buttons["sendButton"].exists)
    }

    func testAfterEnteringAnswearAndTappingButtonSendTextFieldShouldBeEmpty() {
    }
}
