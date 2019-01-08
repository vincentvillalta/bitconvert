//
//  ConversionViewModel.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

struct ConversionViewModel: Equatable {

    var currency: Currency?
    var convertedValue: String?
    var hasFinishedLoading: Bool
    var containsError: Bool
    var error: String?
    
    init(_ state: HomeFlowState){
        self.currency = state.selectedCurrency
        self.convertedValue = state.convertedValue
        self.hasFinishedLoading = !state.isConvertingValue
        self.containsError = state.error == nil
        self.error = state.error
    }

}
