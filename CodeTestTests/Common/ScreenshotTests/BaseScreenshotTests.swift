//
//  BaseScreenshotTests.swift
//  CodeTestTests
//
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import FBSnapshotTestCase
import KIF
@testable import CodeTest

class BaseScreenshotTests: FBSnapshotTestCase {
    
    var window:UIWindow? {
        
        if let app = UIApplication.shared.delegate, let window = app.window {
            return window
        } else {
            return nil
        }
    }
    
    override func setUp() {
        super.setUp()
        KIFEnableAccessibility()
    }
    
    func makeWindowForViewController(viewController:UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
