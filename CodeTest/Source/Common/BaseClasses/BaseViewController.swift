//
//  BaseViewController.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/03/2023.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    func showAlert(title: String, message: String, actionText: String, action: (() -> Void)?)
}

protocol BaseViewControllerProtocol: BaseViewProtocol {
}

class BaseViewController: UIViewController {
    
    deinit {
        print("DeInit ViewController:" + String(describing: self))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getViewModel()?.setView(view: self)
        getViewModel()?.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getViewModel()?.viewWillAppear()
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.getViewModel()?.viewDidAppear()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.getViewModel()?.viewWillDisappear()
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.getViewModel()?.viewDidDisappear()
    }
    
    open func getViewModel() -> BaseViewControllerViewModelProtocol? {
        fatalError("Must Override")
    }
    
    struct AlertModel {
        let title: String
        let message: String
        let leftActionText: String
        let leftAction: (() -> Void)?
        let rightActionText: String?
        let rightAction: (() -> Void)?
    }
    
    func createAlert(model: AlertModel) {
        let alertController = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: model.leftActionText, style: .default, handler: { (_) in
            model.leftAction?()
        }))
        
        if let rightActionText = model.rightActionText {
            alertController.addAction(UIAlertAction(title: rightActionText, style: .default, handler: { (_) in
                model.rightAction?()
            }))
        }
        
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - BaseViewControllerProtocol
extension BaseViewController: BaseViewControllerProtocol {
    func showAlert(title: String, message: String, actionText: String, action: (() -> Void)?) {
        createAlert(model: AlertModel(title: title,
                                      message: message,
                                      leftActionText: actionText,
                                      leftAction: action,
                                      rightActionText: nil,
                                      rightAction: nil))
    }
    
    func showTwoOptionsAlert(model: AlertModel) {
        createAlert(model: model)
    }
    
}
