//
//  UIStackView+Init.swift
//
//
//  Created by Manu on 16/06/2022.
//

import UIKit

public extension UIStackView {
    convenience init(
        _ axis: NSLayoutConstraint.Axis,
        distribution: Distribution,
        alignment: Alignment,
        spacing: CGFloat
    ) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
}
