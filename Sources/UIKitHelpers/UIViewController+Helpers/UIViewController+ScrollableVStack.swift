//
//  UIViewController+ScrollableVStack.swift
//
//
//  Created by Manu on 16/06/2022.
//

import UIKit

public extension UIViewController {
    func setUpScrollableVStack(
        scrollView: UIScrollView,
        vStack: UIStackView,
        insets: UIEdgeInsets = .init(top: 16, left: 0, bottom: 16, right: 0)
    ) {
        setUpScrollView(scrollView, withVStack: vStack, insets: insets)
    }

    func setUpScrollView(
        _ scrollView: UIScrollView,
        withVStack vStack: UIStackView,
        insets: UIEdgeInsets
    ) {
        let contentView = UIView()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pin(.leading, to: .leadingMargin, of: view)
        scrollView.pin(.trailing, to: .trailingMargin, of: view)
        scrollView.pin(.top, to: .topMargin, of: view)
        scrollView.pin(.bottom, to: .bottomMargin, of: view)
        contentView.pinEdges()
        contentView.pin(.width, to: .width, of: scrollView)
        setUpVStack(vStack, in: contentView, insets: insets)
    }

    func setUpVStack(
        _ vStack: UIStackView,
        in contentView: UIView,
        insets: UIEdgeInsets
    ) {
        contentView.addSubview(vStack)
        vStack.pinEdges(.notBottom, withInsets: insets)
        vStack.pin(.bottom, to: .bottom, of: contentView, relatedBy: .lessThanOrEqual, constant: -insets.bottom)
    }
}
