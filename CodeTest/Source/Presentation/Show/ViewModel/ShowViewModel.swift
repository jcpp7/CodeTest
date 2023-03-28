//
//  ShowViewModel.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 15/7/22.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import Foundation

class ShowViewModel<V: ShowViewProtocol>: BaseViewControllerViewModel<V> {
    let router: MainRouter
    let show: Show
    
    init(router: MainRouter, show: Show) {
        self.router = router
        self.show = show
        super.init()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
    }
    
    func dismiss() {
        router.dismiss(animated: true, completion: nil)
    }
}
