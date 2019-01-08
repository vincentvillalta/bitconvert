//
//  HomeActions.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import ReSwiftRouter
import ReSwift
import PromiseKit
enum HomeActions { /* Empty enum for namespacing */ }

protocol HomeActionable: Action {
    func reduce(state: inout HomeFlowState)
}

extension HomeActions {
    //Get activity
    static func convertValue(state: AppState, store: Store<AppState>) -> Action? {
        guard let currency = state.homeFlowState.selectedCurrency else { return nil }
        firstly {
            ConversionService().convertBTCToCurrency(currency)
            }.done { response in
                store.dispatch(ConvertBTCSuccess(response))
            }.catch { error in
                store.dispatch(ConvertBTCFailure(error))
        }
        return ConvertBTCTrigger()
    }
    
    struct ConvertBTCTrigger: HomeActionable {
        func reduce(state: inout HomeFlowState) {
            state.isConvertingValue = true
        }
    }
    
    struct ConvertBTCSuccess: HomeActionable {
        let response: String
        init(_ response: String) { self.response = response }
        
        func reduce(state: inout HomeFlowState) {
            state.isConvertingValue = false
            state.convertedValue = response
        }
    }
    
    struct ConvertBTCFailure: HomeActionable {
        
        let error: Error
        init(_ error: Error) {
            self.error = error
        }
        
        func reduce(state: inout HomeFlowState) {
            state.isConvertingValue = false
            state.error = error.localizedDescription
        }
        
    }
}
