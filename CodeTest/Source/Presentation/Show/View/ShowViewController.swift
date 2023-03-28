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
    @IBOutlet weak var ratingStackView: UIStackView!
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
        navigationController?.navigationBar.tintColor = Asset.Colors.baseColor.uiColor

        titleLabel.text = viewModel.show.name
        titleLabel.textColor = Asset.Colors.primaryColor.uiColor
        let titleFont = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.font = titleFont
        titleLabel.isAccessibilityElement = true

        ratingTitleLabel.textColor = Asset.Colors.lightGrayColor.uiColor
        let headlineFont = UIFont.preferredFont(forTextStyle: .headline)
        ratingTitleLabel.font = headlineFont
        ratingTitleLabel.isAccessibilityElement = true

        ratingValueLabel.textColor = Asset.Colors.lightGrayColor.uiColor
        ratingValueLabel.font = headlineFont
        ratingValueLabel.isAccessibilityElement = true
        
        if let rating = viewModel.show.rating?.average {
            ratingTitleLabel.text = L10n.ratingsTitleKey.text
            ratingValueLabel.text = String(rating)
            ratingStackView.isHidden = false
        }

        if let url = URL(string: viewModel.show.image.medium) {
            mainImageView.imageFrom(url: url)
            mainImageView.backgroundColor = Asset.Colors.backgroundColor.uiColor
        }

        summaryTextView.attributedText = viewModel.show.summary.htmlToAttributedString
        
        self.view.accessibilityIdentifier = "showView"
    }
}

extension ShowViewController: ShowViewProtocol {
    
}
