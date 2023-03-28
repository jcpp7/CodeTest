//
//  ShowViewControler.swift
//  FreshlyPressed
//
//  Copyright © 2020 Automattic. All rights reserved.
//

import UIKit
import WebKit

protocol ShowViewProtocol: BaseViewControllerProtocol {

}

class ShowViewController: BaseViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var closeButton: UIButton!
    
    var viewModel: ShowViewModel<ShowViewController>
    
    init(viewModel: ShowViewModel<ShowViewController>) {
        
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func getViewModel() -> BaseViewControllerViewModelProtocol? {
        return viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCloseButton()
        closeButton.isHidden = UIDevice.current.orientation.isPortrait
        NotificationCenter.default.addObserver(self, selector: #selector(rotate), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    private func configureCloseButton() {
        closeButton.backgroundColor = Asset.Colors.buttonBackground.uiColor
        closeButton.tintColor = Asset.Colors.buttonTintColor.uiColor
        closeButton.layer.cornerRadius = closeButton.layer.frame.width/2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUrl()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        webView.stopLoading()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func loadUrl() {
        
    }
    
    @objc func rotate() {
        closeButton.isHidden = UIDevice.current.orientation.isPortrait
    }
    
    @IBAction func close(_ sender: Any) {
        viewModel.dismiss()
    }
}

extension ShowViewController: ShowViewProtocol {
    
}

extension ShowViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showErrorAlert()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        if error._code == NSURLErrorNotConnectedToInternet {
            showErrorAlert()
        }
    }
    
    private func showErrorAlert() {
        showAlert(title: L10n.postErrorLoadingTitle.text, message: L10n.postErrorLoadingMessage.text, actionText: L10n.postErrorLoadingButton.text) {
            self.viewModel.dismiss()
        }
    }
}
