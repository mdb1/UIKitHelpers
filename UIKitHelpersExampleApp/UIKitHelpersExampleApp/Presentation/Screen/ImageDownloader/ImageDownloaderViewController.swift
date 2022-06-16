//
//  ImageDownloaderViewController.swift
//  UIKitHelpersExampleApp
//
//  Created by Manu on 16/06/2022.
//

import UIKit
import UIKitHelpers

final class ImageDownloaderViewController: UIViewController {
    private let vStack: UIStackView = UIStackView(
        .vertical, distribution: .fill, alignment: .center, spacing: 8
    )
    private let scrollView: UIScrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
}

extension ImageDownloaderViewController: ViewSetUpping {
    func setUpView() {
        title = "Image Downloader"
        view.backgroundColor = .systemBackground
        setUpScrollableVStack(scrollView: scrollView, vStack: vStack)
        setUpImageView()
    }
}

private extension ImageDownloaderViewController {
    enum Constants {
        static let imageSize: CGSize = .init(width: 80, height: 80)
        static let imageURL: String = "https://developer.apple.com/swift/images/swift-og.png"
    }

    func setUpImageView() {
        let imageView = UIImageView()
        imageView.pinSize(Constants.imageSize)
        vStack.addArrangedSubview(imageView)
        imageView.download(from: Constants.imageURL, showLoadingIndicator: true)
    }
}
