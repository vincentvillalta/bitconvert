//
//  Routes.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import ReSwiftRouter
import SafariServices

let onboardingRoute: RouteElementIdentifier = "Onboarding"
let currencySelectorRoute: RouteElementIdentifier = "Currency"
let convertRoute: RouteElementIdentifier = "Convert"

class RootRoutable: Routable {

    let window: UIWindow
    
    init(window: UIWindow?) {
        guard let window = window else { fatalError() }
        self.window = window
    }
    
    func setOnboardingViewController() -> Routable {
        self.window.rootViewController = OnboardingViewController()
        return OnBoardingViewRoutable(self.window.rootViewController)
    }
    
    func setAuthedViewController() -> Routable {
        let navigationController = UINavigationController(rootViewController: CurrencySelectorViewController())
        navigationController.isNavigationBarHidden = true
        self.window.rootViewController = navigationController
        return AuthedRoutes(self.window.rootViewController)
    }
    
    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        if to == onboardingRoute {
            completionHandler()
            return self.setOnboardingViewController()
        } else if to == currencySelectorRoute {
            completionHandler()
            return self.setAuthedViewController()
        } else {
            fatalError("Route not supported!")
        }
    }
    
    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        if routeElementIdentifier == onboardingRoute {
            completionHandler()
            return self.setOnboardingViewController()
        } else if routeElementIdentifier == currencySelectorRoute {
            completionHandler()
            return self.setAuthedViewController()
        } else {
            fatalError("Route not supported!")
        }
    }
    
    func popRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler)
    {
        // TODO: this should technically never be called -> bug in router
        completionHandler()
    }

}
