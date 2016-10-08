//
//  Created by Kamil Pyc on 30/11/15.
//  Copyright © 2015 Allegro. All rights reserved.
//

import FBSnapshotTestCase
import SnapKit

struct TestCondition {
    let size: CGSize
    let name: String
    let sizeCategories: [String]
}

let sizeCategoriesNames = [UIContentSizeCategory.extraSmall,
    UIContentSizeCategory.medium,
    UIContentSizeCategory.extraExtraExtraLarge]

let defaultSizeCategoryName = [UIContentSizeCategory.large]

extension FBSnapshotTestCase {

    func embedViewForTest(_ viewToEmbed: UIView) -> UIView {
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        let containerView = UIView.init(frame: CGRectZero)
        containerView.addSubview(viewToEmbed)
        viewToEmbed.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(containerView)
            make.top.equalTo(containerView)
            make.centerX.equalTo(containerView)
            make.height.lessThanOrEqualTo(containerView)
        }
        return containerView
    }

    // Executes snapshot tests on iPhone 4, 6, 6 Plus and iPad in portrait orientation
    // Takes different font sizes into account
    func performTestViewOnFourPlatformsWithAccessibilityWithView (_ view: UIView, height: Double) {
        let conditions = [TestCondition(size: iPhone4PortraitSize, name: "iPhone4-Portrait", sizeCategories: sizeCategoriesNames as! [String]),
                          TestCondition(size: iPhone6PortraitSize, name: "iPhone6-Portrait", sizeCategories: sizeCategoriesNames),
                          TestCondition(size: iPhone6PlusPortraitSize, name: "iPhone6Plus-Portrait", sizeCategories: sizeCategoriesNames),
                          TestCondition(size: iPadPortraitSize, name: "iPad-Portrait", sizeCategories: sizeCategoriesNames)]
        self.performTestsWithConditions(view, height: height, conditions: conditions)
    }

    // Executes snapshot tests on iPhone 4, 6, 6 Plus and iPad in both orientations
    // Does not take different font sizes into account
    func performTestViewOnFourPlatformsWithoutAccessibilityInPortraitAndLandscapeWithView (_ view: UIView, height: Double) {
        let conditions = [TestCondition(size: iPhone4PortraitSize, name: "iPhone4-Portrait", sizeCategories: defaultSizeCategoryName as! [String]),
            TestCondition(size: iPhone6PortraitSize, name: "iPhone6-Portrait", sizeCategories: defaultSizeCategoryName),
            TestCondition(size: iPhone6PlusPortraitSize, name: "iPhone6Plus-Portrait", sizeCategories: defaultSizeCategoryName),
            TestCondition(size: iPadPortraitSize, name: "iPad-Portrait", sizeCategories: defaultSizeCategoryName),
            TestCondition(size: iPhone4LandscapeSize, name: "iPhone4-Landscape", sizeCategories: defaultSizeCategoryName),
            TestCondition(size: iPhone6LandscapeSize, name: "iPhone6-Landscape", sizeCategories: defaultSizeCategoryName),
            TestCondition(size: iPhone6PlusLandscapeSize, name: "iPhone6Plus-Landscape", sizeCategories: defaultSizeCategoryName),
        TestCondition(size: iPadLandscapeSize, name: "iPad-Landscape", sizeCategories: defaultSizeCategoryName)]
        self.performTestsWithConditions(view, height: height, conditions: conditions)
    }

    func performTestsWithConditions(_ view: UIView, height: Double, conditions: [TestCondition]) {
        for condition in conditions {
            self.performTestsWithCondition(view, height:height,  condition:condition)
        }
    }

    func performTestsWithCondition(_ view: UIView, height: Double, condition: TestCondition) {
        for sizeCategory in condition.sizeCategories {
            view.bounds = CGRect(x: 0.0, y: 0.0, width: condition.size.width, height: CGFloat(height))
            view.layoutIfNeeded()
            ContentSizeCategoryMocker.mockContenSizeCategory(sizeCategory)
            FBSnapshotVerifyView(view, identifier: condition.name + sizeCategory)
            ContentSizeCategoryMocker.stopMocking()
        }
    }

    func performTestsWithSize(_ view: UIView, size: CGSize) {
            view.bounds = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
            view.layoutIfNeeded()
            FBSnapshotVerifyView(view)
    }
}
