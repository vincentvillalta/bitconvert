
//
//  UITextField+Extensions.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

extension UITextField {
    func addChangeTarget(_ target: Any?, action: Selector) {
        addTarget(target, action: action, for: .editingChanged)
    }
}
