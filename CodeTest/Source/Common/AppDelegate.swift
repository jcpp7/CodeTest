//
//  AppDelegate.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/3/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController: ShowsViewController = AppAssembler.resolve()
        let navController: UINavigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()

        return true
    }
}

