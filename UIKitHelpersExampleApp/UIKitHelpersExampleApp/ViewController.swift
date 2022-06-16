//
//  ViewController.swift
//  UIKitHelpersExampleApp
//
//  Created by Manu on 16/06/2022.
//

import UIKit
import UIKitHelpers

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayNotImplementedYetToast()
    }
}

extension ViewController: ViewSetUpping {
    func setUpView() {
        view.backgroundColor = .systemBackground
        setUpAdaptableStack()
    }
}

private extension ViewController {
    func setUpAdaptableStack() {
        let stack = AdaptableStackView(.horizontal, distribution: .fillEqually, alignment: .center, spacing: 8)
        view.addSubview(stack)
        stack.pinEdgesToMargins(.notBottom)

        let v = UILabel()
        v.backgroundColor = .red
        v.text = "Hey"
        stack.addArrangedSubview(v)
        let v2 = UILabel()
        v2.backgroundColor = .blue
        v2.text = "You"
        stack.addArrangedSubview(v2)
    }
}
