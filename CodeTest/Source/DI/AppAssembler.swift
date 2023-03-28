//
//  AppAssembler.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/03/2023.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit

@objc public class AppAssembler: NSObject {
    
    @objc static let shared = AppAssembler()
    
    var window: UIWindow? {
        if let app = UIApplication.shared.delegate, let window = app.window {
            return window
        } else {
            return nil
        }
    }
    // MARK: - Routers
    static func resolve() -> MainRouter {
        return MainRouter.shared
    }
    
    // MARK: - ViewModels
    class func resolve() -> ShowsViewModel<ShowsViewController> {
        return ShowsViewModel(router: resolve(), showsRepository: resolve())
    }
    
    class func resolve(show: Show) -> ShowViewModel<ShowViewController> {
        return ShowViewModel(router: resolve(), show: show)
    }
    
    // MARK: - ViewControllers
    class func resolve() -> ShowsViewController {
        return ShowsViewController(viewModel: resolve())
    }
    
    class func resolve(show: Show) -> ShowViewController {
        return ShowViewController(viewModel: resolve(show: show))
    }
    
    // MARK: Repositories
    class func resolve() -> ShowsRepository {
        return ShowsRepository()
    }
}
