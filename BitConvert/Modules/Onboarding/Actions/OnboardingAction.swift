//
//  OnboardingAction.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import ReSwiftRouter
import ReSwift

enum OnboardingAction { /* Empty enum for namespacing */ }

protocol OnboardingActionable: Action {
    func reduce(state: inout OnboardingFlowState)
}

extension OnboardingAction {
    
    struct Reset: OnboardingActionable {
        func reduce(state: inout OnboardingFlowState) {
            state = .makeDefault()
        }
    }
    
    struct SetNameValue: OnboardingActionable {
        private let name: String
        init(_ name: String) {
            self.name = name
        }
        
        func reduce(state: inout OnboardingFlowState) {
            state.name = name
        }
    }
    
}
