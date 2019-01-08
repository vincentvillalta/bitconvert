//
//  NavigationController+CompletionBlock.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func pushViewController(_ viewController: UIViewController,
                            animated: Bool, completion: @escaping () -> Void) {
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func popViewController(_ animated: Bool, completion: @escaping () -> Void) {
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }
    
}

