//
//  UIView+AnimateLayout.swift
//
//
//  Created by Manu on 16/06/2022.
//

import UIKit

public extension UIView {
    func animateLayout() {
        setNeedsLayout()

        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
}
