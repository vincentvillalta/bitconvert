//
//  OnboardingFlowReducer.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import Foundation
import ReSwift

func onboardingFlowReducer(state: OnboardingFlowState?, action: Action) -> OnboardingFlowState {

    var state = state ?? OnboardingFlowState.makeDefault()
    
    switch action {
    case let action as OnboardingActionable:
        action.reduce(state: &state)
    default:
        break
    }
    
    return state

}
