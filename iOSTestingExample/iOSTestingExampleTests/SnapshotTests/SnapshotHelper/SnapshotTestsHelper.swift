//
//  Created by Kamil Pyc on 30/11/15.
//  Copyright © 2015 Allegro. All rights reserved.
//

import FBSnapshotTestCase
import SnapKit
import iOSTestingExample

struct TestCondition {
    let size: CGSize
    let name: String
    let sizeCategories: [UIContentSizeCategory]
}

let sizeCategoriesForTestingWithAccessibility: [UIContentSizeCategory] = [.extraSmall, .medium, .extraExtraExtraLarge]
let defaultSizeCategory = UIContentSizeCategory.large

extension FBSnapshotTestCase {

    func embedViewForTest(viewToEmbed: UIView) -> UIView {
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        let containerView = UIView.init(frame: CGRect.zero)
        containerView.addSubview(viewToEmbed)
        viewToEmbed.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(containerView)
            make.top.equalTo(containerView)
            make.centerX.equalTo(containerView)
            make.height.lessThanOrEqualTo(containerView)
        }
        return containerView
    }

    func snapshotTest(view: UIView, size: CGSize) {
        view.bounds = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        view.layoutIfNeeded()
        FBSnapshotVerifyView(view)
    }

    func snapshotTestOnFourPlatforms(view: UIView, height: CGFloat, withAccessibility: Bool = false, inBothOrientations: Bool = false) {
        let sizeCategories = withAccessibility ? sizeCategoriesForTestingWithAccessibility : [ defaultSizeCategory ]
        var conditions = [TestCondition(size: iPhone4PortraitSize, name: "iPhone4-Portrait", sizeCategories: sizeCategories),
                          TestCondition(size: iPhone6PortraitSize, name: "iPhone6-Portrait", sizeCategories: sizeCategories),
                          TestCondition(size: iPhone6PlusPortraitSize, name: "iPhone6Plus-Portrait", sizeCategories: sizeCategories),
                          TestCondition(size: iPadPortraitSize, name: "iPad-Portrait", sizeCategories: sizeCategories)]
        if inBothOrientations {
            let additionalConditions = [TestCondition(size: iPhone4LandscapeSize, name: "iPhone4-Landscape", sizeCategories: sizeCategories),
                                        TestCondition(size: iPhone6LandscapeSize, name: "iPhone6-Landscape", sizeCategories: sizeCategories),
                                        TestCondition(size: iPhone6PlusLandscapeSize, name: "iPhone6Plus-Landscape", sizeCategories: sizeCategories),
                                        TestCondition(size: iPadLandscapeSize, name: "iPad-Landscape", sizeCategories: sizeCategories)]
            conditions.append(contentsOf: additionalConditions)
        }
        self.snapshotTest(view: view, height: height, conditions: conditions)
    }

    // Private functions

    func snapshotTest(view: UIView, height: CGFloat, conditions: [TestCondition]) {
        for condition in conditions {
            self.snapshotTest(view: view, height: height, condition: condition)
        }
    }

    func snapshotTest(view: UIView, height: CGFloat, condition: TestCondition) {
        for sizeCategory in condition.sizeCategories {
            view.bounds = CGRect(x: 0.0, y: 0.0, width: condition.size.width, height: height)
            view.layoutIfNeeded()
            ContentSizeCategoryMocker.mockContentSizeCategory(sizeCategory.rawValue)
            FBSnapshotVerifyView(view, identifier: condition.name + sizeCategory.rawValue)
            ContentSizeCategoryMocker.stopMocking()
        }
    }
}
