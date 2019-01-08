//
//  ConversionViewTest.swift
//  BitConvertTests
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

@testable import BitConvert
import FBSnapshotTestCase
import XCTest

class ConversionViewTest: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    var snapshotSize: CGSize {
        return CGSize(width: 375.0, height: 667.0)
    }
    
    func testUSD() {
        let view = ConversionView()
        let model = ConversionViewModel(HomeFlowState(selectedCurrency: Currency(name: "US Dollar", symbol: "$", isoCurrency: "USD"), convertedValue: "89928.09", isConvertingValue: false, error: nil))
        view.update(viewModel: model)
        view.frame = CGRect(origin: .zero, size: snapshotSize)
        FBSnapshotVerifyView(view)
    }
    
    func testEUR() {
        let view = ConversionView()
        let model = ConversionViewModel(HomeFlowState(selectedCurrency: Currency(name: "Euro", symbol: "€", isoCurrency: "EUR"), convertedValue: "91928.09", isConvertingValue: false, error: nil))
        view.update(viewModel: model)
        view.frame = CGRect(origin: .zero, size: snapshotSize)
        FBSnapshotVerifyView(view)
    }
    
    func testLoading() {
        let view = ConversionView()
        let model = ConversionViewModel(HomeFlowState(selectedCurrency: Currency(name: "Euro", symbol: "€", isoCurrency: "EUR"), convertedValue: nil, isConvertingValue: true, error: nil))
        view.update(viewModel: model)
        view.frame = CGRect(origin: .zero, size: snapshotSize)
        FBSnapshotVerifyView(view)
    }

}
