//
//  AppDelegate.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router<AppState>!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        
        let rootRoutable = RootRoutable(window: window)
        router = Router(store: Dependency.shared.store, rootRoutable: rootRoutable) { state in
            state.select { $0.navigationState }
        }
        if UserDefaults.standard.string(forKey: "userName") != nil {
            Dependency.shared.store.dispatch(ReSwiftRouter.SetRouteAction([currencySelectorRoute]))
        } else {
            Dependency.shared.store.dispatch(ReSwiftRouter.SetRouteAction([onboardingRoute]))
        }
        window?.makeKeyAndVisible()
    
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        if UserDefaults.standard.string(forKey: "userName") != nil {
            Dependency.shared.store.dispatch(ReSwiftRouter.SetRouteAction([currencySelectorRoute]))
            (window?.rootViewController as? UINavigationController)?.popViewController(animated: true)
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

