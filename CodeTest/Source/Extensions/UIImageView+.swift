//
//  UIImageView+.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 14/2/23.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func imageFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
