//
//  OnboardingViewTest.swift
//  BitConvertTests
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

@testable import BitConvert
import FBSnapshotTestCase
import XCTest

class OnboardingViewTest: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    var snapshotSize: CGSize {
        return CGSize(width: 375.0, height: 667.0)
    }
    
    func testDefault() {
        let view = OnboardingView()
        let model = OnboardingViewModel(OnboardingFlowState(name: ""))
        view.update(viewModel: model)
        view.frame = CGRect(origin: .zero, size: snapshotSize)
        FBSnapshotVerifyView(view)
    }
    
    func testDefaultWithText() {
        let view = OnboardingView()
        let model = OnboardingViewModel(OnboardingFlowState(name: "hello world"))
        view.update(viewModel: model)
        view.frame = CGRect(origin: .zero, size: snapshotSize)
        FBSnapshotVerifyView(view)
    }

}
