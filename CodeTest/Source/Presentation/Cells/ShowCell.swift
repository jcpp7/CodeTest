//
//  ShowCell.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 14/2/23.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit

class ShowCell: UICollectionViewCell {
    
    class var identifier: String {
        "ShowCell"
    }
    
    class var height: CGFloat {
        100
    }
    
    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    private func configureView() {
        titleLabel.textColor = Asset.Colors.primaryColor.uiColor
        featuredImage.backgroundColor = Asset.Colors.backgroundColor.uiColor
        
        featuredImage.layer.cornerRadius = 8.0
        featuredImage.clipsToBounds = true
        
        let headlineFont = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.font = headlineFont
        titleLabel.isAccessibilityElement = true

    }
    
    func configure(show: Show) {
        titleLabel.text = show.name
        let placeholder = Asset.Images.tvmazeLogo.image
        featuredImage.image = placeholder
        
        if let url = URL(string: show.image.medium) {
            featuredImage.imageFrom(url: url)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        featuredImage.image = nil
    }
}
