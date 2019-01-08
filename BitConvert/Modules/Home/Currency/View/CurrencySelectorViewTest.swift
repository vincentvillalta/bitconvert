//
//  CurrencySelectorViewTest.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

@testable import BitConvert
import FBSnapshotTestCase
import XCTest

class CurrencySelectorViewTest: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    var snapshotSize: CGSize {
        return CGSize(width: 375.0, height: 667.0)
    }
    
    func testView() {
        let view = CurrencySelectorView()
        view.frame = CGRect(origin: .zero, size: snapshotSize)
        FBSnapshotVerifyView(view)
    }

}
