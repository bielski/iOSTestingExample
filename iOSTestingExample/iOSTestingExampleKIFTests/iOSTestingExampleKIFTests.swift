//
//  iOSTestingExampleKIFTests.swift
//  iOSTestingExampleKIFTests
//
//  Created by Ewa Bielska on 02.06.2016.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import XCTest
import KIF

class iOSTestingExampleKIFTests: KIFTestCase {

    let testAnswear = "I really like it!"

    func testMainViewControllerLayout() {
        
        // Wait for layout components
        viewTester.usingIdentifier("questionLabel").waitForView()
    }

    func testAfterEnteringAnswerAndTappingButtonSendAnswerTextFieldShouldBeEmpty() {
        
        // Enter text into text field
        viewTester.usingIdentifier("answearTextField").enterText(testAnswear)

        // Tap send button
        viewTester.usingIdentifier("sendButton").tap()

        // Assert if text field accessibilityValue is nil
        XCTAssertNil(viewTester.usingIdentifier("answearTextField").accessibilityValue)
        XCTAssertTrue((viewTester.usingIdentifier("answearTextField").waitForView() as! UITextField).text!.isEmpty)
    }
}
