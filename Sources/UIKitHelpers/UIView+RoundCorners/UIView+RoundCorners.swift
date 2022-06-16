//
//  UIView+RoundCorners.swift
//
//
//  Created by Manu on 16/06/2022.
//

import Foundation
import UIKit

public extension UIView {
    func round() {
        round(with: frame.height / 2.0)
    }

    func round(with cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }

    /// Sets the corner radius to make all the parameter borders rounded.
    /// - Parameters:
    ///   - corners: The list of corners to round
    ///   - radius: The cornerRadius to set to the corners
    func round(corners: [SingularCorner], radius: CGFloat) {
        round(with: radius)
        let layerCorners = corners.compactMap { $0.toCornerMask() }
        var maskedCorners: CACornerMask = []
        layerCorners.forEach { maskedCorners.insert($0) }
        layer.maskedCorners = maskedCorners
    }
}

public enum SingularCorner {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight

    func toCornerMask() -> CACornerMask {
        switch self {
        case .topLeft:
            return .layerMinXMinYCorner
        case .topRight:
            return .layerMaxXMinYCorner
        case .bottomLeft:
            return .layerMinXMaxYCorner
        case .bottomRight:
            return .layerMaxXMaxYCorner
        }
    }
}
