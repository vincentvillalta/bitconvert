//
//  Dependency.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import Foundation
import ReSwift
import UIKit

class Dependency {
    
    static var shared = Dependency()
    
    lazy var store: Store<AppState> = {
        return Store<AppState>(reducer: appReducer, state: nil)
    }()
    
}

