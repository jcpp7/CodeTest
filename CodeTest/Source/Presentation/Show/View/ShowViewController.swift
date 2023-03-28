//
//  ShowViewControler.swift
//  CodeTest
//
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit
import WebKit

protocol ShowViewProtocol: BaseViewControllerProtocol {

}

class ShowViewController: BaseViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingTitleLabel: UILabel!
    @IBOutlet weak var ratingValueLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureView() {
        if let url = URL(string: viewModel.show.image.medium) {
            mainImageView.imageFrom(url: url)
        }
        titleLabel.text = viewModel.show.name
        if let rating = viewModel.show.rating?.average {
            ratingTitleLabel.text = String(rating)
        }
        summaryTextView.text = viewModel.show.summary
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
        showAlert(title: L10n.showErrorLoadingTitle.text, message: L10n.showErrorLoadingMessage.text, actionText: L10n.showErrorLoadingButton.text) {
            self.viewModel.dismiss()
        }
    }
}
