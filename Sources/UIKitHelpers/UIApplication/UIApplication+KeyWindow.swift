//
//  UIApplication+KeyWindow.swift
//
//
//  Created by Manu on 16/06/2022.
//

import UIKit

public extension UIApplication {
    static var keyWindow: UIWindow? {
        // Get connected scenes
        UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap { $0 as? UIWindowScene }?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
}

// MARK: - Free functions

public func displayNotImplementedYetToast() {
    let toast = UILabel()
    toast.backgroundColor = .systemRed
    toast.text = "Not implemented yet"
    toast.supportDynamicType(size: 16, weight: .bold)
    toast.textColor = .white
    toast.textAlignment = .center
    UIApplication.keyWindow?.addSubview(toast)
    guard toast.superview != nil else { return }

    toast.pinEdgesToMargins(.notTop, withInsets: .init(top: 0, left: 0, bottom: 0, right: 0))
    toast.pin(.height, constant: 60)
    toast.round(with: 30)
    toast.transform = .init(translationX: 0, y: 60)
    toast.alpha = 0
    UIView.animate(withDuration: 0.25) {
        toast.transform = .identity
        toast.alpha = 1
    } completion: { _ in
        UIView.animate(withDuration: 0.25, delay: 3.0) {
            toast.transform = .init(translationX: 0, y: 60)
            toast.alpha = 0
        } completion: { _ in
            toast.removeFromSuperview()
        }
    }
}
