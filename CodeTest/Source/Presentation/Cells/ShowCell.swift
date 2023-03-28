//
//  ShowCell.swift
//  FreshlyPressed
//
//  Created by Jose Cruz Perez Pi on 14/2/23.
//  Copyright © 2023 Automattic. All rights reserved.
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
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    private func configureView() {
        title.textColor = Asset.Colors.primaryColor.uiColor
        date.textColor = Asset.Colors.lightGrayColor.uiColor
        featuredImage.backgroundColor = Asset.Colors.backgroundColor.uiColor
        
        featuredImage.layer.cornerRadius = 8.0
        featuredImage.clipsToBounds = true
        
        let headlineFont = UIFont.preferredFont(forTextStyle: .headline)
        title.font = headlineFont
        title.isAccessibilityElement = true

        let subheadlineFont = UIFont.preferredFont(forTextStyle: .caption1)
        date.font = subheadlineFont
        date.isAccessibilityElement = true
    }
    
    func configure(show: Show) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        featuredImage.image = nil
        featuredImage.cancelImageLoad()
    }
}
