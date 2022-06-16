//
//  UIView+RandomizeColors.swift
//
//
//  Created by Manu on 16/06/2022.
//

import UIKit

extension UIView {
    /// Changes the background color of the view and all it's subviews for random ones.
    /// Use this method only on debug mode.
    public func randomizeColors() {
        #if DEBUG
            backgroundColor = getRandomColor()
            subviews.forEach { $0.randomizeColors() }
        #endif
    }

    private func getRandomColor() -> UIColor {
        UIColor(
            red: CGFloat.random(in: 0 ... 1),
            green: CGFloat.random(in: 0 ... 1),
            blue: CGFloat.random(in: 0 ... 1),
            alpha: 1.0
        )
    }
}
