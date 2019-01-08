//
//  HomeFlowState.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

struct HomeFlowState: Equatable {

    var selectedCurrency: Currency?
    var convertedValue: String?
    var isConvertingValue: Bool
    var error: String?
    
    static func makeDefault() -> HomeFlowState {
        return HomeFlowState(
            selectedCurrency: nil,
            convertedValue: nil,
            isConvertingValue: false,
            error: nil
        )
    }

}
