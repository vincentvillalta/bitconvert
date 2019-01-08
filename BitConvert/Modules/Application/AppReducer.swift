//
//  AppReducer.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import ReSwift
import ReSwiftRouter

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        navigationState: NavigationReducer.handleAction(action, state: state?.navigationState),
        onboardingFlowState: onboardingFlowReducer(state: state?.onboardingFlowState, action: action), homeFlowState: homeFlowReducer(state: state?.homeFlowState, action: action)
    )
}
