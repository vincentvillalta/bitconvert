//
//  HomeFlowReducer.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import ReSwift

func homeFlowReducer(state: HomeFlowState?, action: Action) -> HomeFlowState {
    var state = state ?? HomeFlowState.makeDefault()
    
    switch action {
    case let action as HomeActionable:
        action.reduce(state: &state)
    default:
        break
    }
    
    return state
}
