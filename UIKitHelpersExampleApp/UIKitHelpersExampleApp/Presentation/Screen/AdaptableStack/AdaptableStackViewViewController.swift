//
//  AdaptableStackViewViewController.swift
//  UIKitHelpersExampleApp
//
//  Created by Manu on 16/06/2022.
//

import UIKit
import UIKitHelpers

final class AdaptableStackViewViewController: UIViewController {
    private let vStack: UIStackView = UIStackView(.vertical, distribution: .fill, alignment: .fill, spacing: 8)
    private let scrollView: UIScrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
}

extension AdaptableStackViewViewController: ViewSetUpping {
    func setUpView() {
        title = "Adaptable StackView"
        view.backgroundColor = .systemBackground
        setUpScrollableVStack(scrollView: scrollView, vStack: vStack)
        setUpAdaptableStack()
    }
}

private extension AdaptableStackViewViewController {
    func setUpAdaptableStack() {
        let adaptableStack = AdaptableStackView(
            .horizontal, distribution: .fillEqually, alignment: .center, spacing: 8
        )
        vStack.addArrangedSubview(adaptableStack)

        let leftLabel = UILabel()
        leftLabel.backgroundColor = .red
        leftLabel.text = "Hey"
        leftLabel.textColor = .white
        leftLabel.supportDynamicType(size: 16, weight: .bold, numberOfLines: 0)
        leftLabel.textAlignment = .center
        adaptableStack.addArrangedSubview(leftLabel)
        let rightLabel = UILabel()
        rightLabel.backgroundColor = .blue
        rightLabel.text = "You"
        rightLabel.textColor = .white
        rightLabel.supportDynamicType(size: 16, weight: .bold, numberOfLines: 0)
        rightLabel.textAlignment = .center
        adaptableStack.addArrangedSubview(rightLabel)
    }
}
