//
//  AppState.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

struct AppState: StateType, HasNavigationState {
    var navigationState: NavigationState
    
    // Initial State
    var onboardingFlowState: OnboardingFlowState
    
    // Name provided
    var homeFlowState: HomeFlowState
}
