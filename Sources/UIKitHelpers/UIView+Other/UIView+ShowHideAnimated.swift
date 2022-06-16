//
//  UIView+ShowHideAnimated.swift
//
//
//  Created by Manu on 16/06/2022.
//

import UIKit

public extension UIView {
    func hideAnimated(in stackView: UIStackView) {
        guard !isHidden else { return }

        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1,
            options: [],
            animations: {
                self.alpha = 0
                self.isHidden = true
                stackView.layoutIfNeeded()
            },
            completion: nil
        )
    }

    func showAnimated(in stackView: UIStackView) {
        guard isHidden else { return }

        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1,
            options: [],
            animations: {
                self.alpha = 1
                self.isHidden = false
                stackView.layoutIfNeeded()
            },
            completion: nil
        )
    }
}
