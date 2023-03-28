//
//  BaseViewModel.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/03/2023.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewModelProtocol: AnyObject {
    func setView(view theView: BaseViewProtocol)
}

protocol BaseViewControllerViewModelProtocol: BaseViewModelProtocol {
    
    /// Called when the view did load.
    func viewDidLoad()
    
    /// Called when the view will appear.
    func viewWillAppear()
    
    /// Called when the view did appear.
    func viewDidAppear()
    
    /// Called when the view will disappear.
    func viewWillDisappear()
    
    /// Called when the view did disappear.
    func viewDidDisappear()
}

class BaseViewModel<V: BaseViewProtocol>: BaseViewModelProtocol {
    
    /// The view.
    weak var view: V?
    
    func setView(view theView: BaseViewProtocol) {
        self.view = (theView as? V)
        viewDidSet()
    }
    
    deinit {
        print("DeInit ViewModel:" + String(describing: self))
    }
    
    func viewDidSet() {
        /// Called when the view did set.
    }
}

class BaseViewControllerViewModel<V: BaseViewControllerProtocol>: BaseViewModel<V>, BaseViewControllerViewModelProtocol {
    
    func viewDidLoad() {
        /// Called when the view did load.
    }
    
    func viewWillAppear() {
        /// Called when the view will appear.
    }
    
    func viewDidAppear() {
        /// Called when the view did appear.
    }
    
    func viewWillDisappear() {
        /// Called when the view will disappear.
    }
    
    func viewDidDisappear() {
        /// Called when the view did disappear.
    }
        
}
