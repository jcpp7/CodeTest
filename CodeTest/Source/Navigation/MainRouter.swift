//
//  MainRouter.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/03/2023.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit

class MainRouter: BaseRouter {
    
    static let shared = MainRouter()
    
    func navigateToShowDetails(show: Show) {
        let viewController: ShowViewController = AppAssembler.resolve(show: show)
        pushViewController(viewController, animated: true)
    }
}
