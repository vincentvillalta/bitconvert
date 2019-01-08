//
//  OnboardingViewModel.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

struct OnboardingViewModel: Equatable {
    var nameValue: String
    var canContinue: Bool
    
    init(_ state: OnboardingFlowState) {
        nameValue = state.name
        canContinue = !state.name.isEmpty
    }
}
