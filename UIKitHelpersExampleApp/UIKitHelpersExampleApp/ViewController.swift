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
        view.backgroundColor = .cyan
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayNotImplementedYetToast()
    }
}
