//
//  AdaptableStackView.swift
//
//
//  Created by Manu on 16/06/2022.
//

import Combine
import UIKit

public final class AdaptableStackView: UIStackView {
    private var contentSizeSub: [AnyCancellable] = []

    override init(frame: CGRect) {
        super.init(frame: frame)

        NotificationCenter.default
            .publisher(for: UIContentSizeCategory.didChangeNotification)
            .compactMap { $0.userInfo?[UIContentSizeCategory.newValueUserInfoKey] }
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.adjustAxisIfNeeded()
            }
            .store(in: &contentSizeSub)
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func adjustAxisIfNeeded() {
        let isAccessibilitySize = UIApplication.shared.preferredContentSizeCategory.isAccessibilityCategory
        if isAccessibilitySize {
            axis = .vertical
            alignment = .fill
        } else {
            axis = .horizontal
            alignment = .firstBaseline
        }
    }
}
