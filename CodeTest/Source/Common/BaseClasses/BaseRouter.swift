//
//  BaseRouter.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/03/2023.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    func setRootViewController(viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func presentViewController(_ viewController: UIViewController, animated: Bool)
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

class BaseRouter: RouterProtocol {
    private let window: UIWindow
    
    // MARK: - Initialization
    init() {
        window = AppAssembler.shared.window!
    }
    
    func setRootViewController(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        window.rootViewController?.dismiss(animated: animated, completion: nil)
        window.rootViewController = viewController
    }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if let nvc = (window.rootViewController as? UINavigationController) {
            nvc.pushViewController(viewController, animated: animated)
        }
    }
    
    func presentViewController(_ viewController: UIViewController, animated: Bool) {
        if let nvc = (window.rootViewController as? UINavigationController) {
            nvc.present(viewController, animated: true)
        }
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        if let nvc = (window.rootViewController as? UINavigationController) {
            nvc.dismiss(animated: true, completion: completion)
        }
    }
}
