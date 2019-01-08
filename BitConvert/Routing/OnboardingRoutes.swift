//
//  OnboardingRoutes.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import ReSwiftRouter
import SafariServices

class OnBoardingViewRoutable: Routable {
    let viewController: UIViewController
    
    init(_ viewController: UIViewController?){
        guard let viewController = viewController else { fatalError() }
        self.viewController = viewController
    }
    
}
