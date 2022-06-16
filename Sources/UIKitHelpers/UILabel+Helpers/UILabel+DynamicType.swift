//
//  UILabel+DynamicType.swift
//
//
//  Created by Manu on 10/06/2022.
//

import UIKit

public extension UILabel {
    func supportDynamicType(size: CGFloat, weight: UIFont.Weight = .regular, numberOfLines: Int = 0) {
        self.numberOfLines = numberOfLines
        adjustsFontForContentSizeCategory = true
        font = .systemFont(ofSize: size, weight: weight).scaled
    }
}

public extension UIFont {
    var scaled: UIFont {
        UIFontMetrics(forTextStyle: .title1).scaledFont(for: self)
    }
}
