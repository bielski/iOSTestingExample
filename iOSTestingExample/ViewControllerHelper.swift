//
//  Created by Kamil Pyc on 19/11/2016.
//
//

import UIKit
@testable import iOSTestingExample

// MARK: Helper
public func viewController() -> ViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateInitialViewController() as! ViewController
}


public func mainView() -> UIView {

    return viewController().view
}
