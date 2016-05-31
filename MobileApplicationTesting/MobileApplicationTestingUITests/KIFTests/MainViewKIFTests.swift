//
//  Created by Ewa Bielska on 15/04/16.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import UIKit
import XCTest
import KIF

extension XCTestCase {

    func viewTester(file : String = #file, _ line : Int = #line) -> KIFUIViewTestActor {
        return KIFUIViewTestActor(inFile: file, atLine: line, delegate: self)
    }

    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

class MainViewKIFTests: KIFTestCase {

    func testMainViewTextFieldShouldDisplayTypedText() {
        viewTester().usingLabel("abc").waitForAbsenceOfView()
    }
}
