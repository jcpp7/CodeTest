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
  func loadImage(at url: URL) {
    UIImageLoader.loader.load(url, for: self)
  }

  func cancelImageLoad() {
    UIImageLoader.loader.cancel(for: self)
  }
}
