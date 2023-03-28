//
//  BaseLabel.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 13/2/23.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
