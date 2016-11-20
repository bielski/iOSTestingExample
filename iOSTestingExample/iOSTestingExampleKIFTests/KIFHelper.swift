//
//  iOSTestingExampleKIFTests.swift
//  iOSTestingExampleKIFTests
//
//  Created by Ewa Bielska on 02.06.2016.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import XCTest
import KIF

extension XCTestCase {
    
    // In Swift macros are not supported
    // Non-macro version of `viewTester` by using a function can be used instead
    // Details: https://www.natashatherobot.com/kif-swift-feature-testing/
    
    var viewTester: KIFUIViewTestActor { return viewTester() }
    
    fileprivate func viewTester(_ file : String = #file, _ line : Int = #line) -> KIFUIViewTestActor {
        return KIFUIViewTestActor(inFile: file, atLine: line, delegate: self)
    }
}
