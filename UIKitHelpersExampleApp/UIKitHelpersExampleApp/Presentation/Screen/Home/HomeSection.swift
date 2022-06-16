//
//  HomeSection.swift
//  UIKitHelpersExampleApp
//
//  Created by Manu on 16/06/2022.
//

import Foundation

enum HomeSection {
    case general(_ generalRows: [GeneralRow])
}

enum GeneralRow {
    case imageDownloader
    case adaptableStackView

    var title: String {
        switch self {
        case .imageDownloader:
            return "Image Downloader"
        case .adaptableStackView:
            return "Adaptable StackView"
        }
    }
}
