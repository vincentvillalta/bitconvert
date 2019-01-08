//
//  AuthedRoutes.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import ReSwiftRouter
import SafariServices

class AuthedRoutes: Routable {
    let viewController: UIViewController
    
    init(_ viewController: UIViewController?){
        guard let viewController = viewController else { fatalError() }
        self.viewController = viewController
    }
    
    func pushRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        if routeElementIdentifier == convertRoute {
            let conversionViewController = ConversionViewController()
            (self.viewController as! UINavigationController).pushViewController(conversionViewController, animated: true, completion: completionHandler)
            
            return ConversionRoutable()
        }
        
        fatalError("Cannot handle this route change!")
    }
    
    func popRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) {
        // no-op, since this is called when VC is already popped.
        completionHandler()
    }

}

class ConversionRoutable: Routable { }
