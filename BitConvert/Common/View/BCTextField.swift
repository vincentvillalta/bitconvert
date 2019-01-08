//
//  BCTextField.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

class BCTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 6.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 20
    }
}
