//
//  OnboardingFlowState.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

struct OnboardingFlowState: Equatable {
    
    var name: String
    
    static func makeDefault() -> OnboardingFlowState {
        return OnboardingFlowState(name: "")
    }
}
