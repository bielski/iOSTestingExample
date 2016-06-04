//
//  iOSTestingExampleKIFTests.swift
//  iOSTestingExampleKIFTests
//
//  Created by ewa on 02.06.2016.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import XCTest
import KIF

extension XCTestCase {
    
    var tester: KIFUITestActor { return tester() }
    var system: KIFSystemTestActor { return system() }
    
    private func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    private func viewTester(file : String = #file, _ line : Int = #line) -> KIFUIViewTestActor {
        return KIFUIViewTestActor(inFile: file, atLine: line, delegate: self)
    }
    
    private func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

class iOSTestingExampleKIFTests: KIFTestCase {

    let testAnswear = "I really like it!"

    func testMainViewControllerLayout() {
        viewTester().usingIdentifier("questionLabel").waitForView()
        viewTester().usingIdentifier("answearTextField").waitToBecomeTappable()
        viewTester().usingIdentifier("sendButton").waitToBecomeTappable()
    }

    func testAfterEnteringAnswearAndTappingButtonSendTextFieldShouldBeEmpty() {
        // Enter text into text field
        viewTester().usingIdentifier("answearTextField").enterText(testAnswear, expectedResult: testAnswear)

        // Tap send button
        viewTester().usingIdentifier("sendButton").tap()

        // Assert if text field accessibilityValue is nil
        XCTAssertNil(viewTester().usingIdentifier("answearTextField").accessibilityValue)
        XCTAssert((viewTester().usingIdentifier("answearTextField").waitForView() as! UITextField).text == "")
    }
}
