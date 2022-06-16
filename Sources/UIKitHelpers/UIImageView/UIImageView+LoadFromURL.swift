//
//  UIImageView+LoadFromURL.swift
//
//
//  Created by Manu on 16/06/2022.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

public extension UIImageView {
    func load(from URLString: String?, placeHolderName: String? = nil) {
        image = nil
        var placeholder: UIImage?
        if let placeHolderName = placeHolderName,
           let placeholderImage = UIImage(named: placeHolderName, in: .main, compatibleWith: nil) {
            placeholder = placeholderImage
            image = placeholderImage
        }
        if let URLString = URLString {
            load(from: URLString, placeHolder: placeholder)
        }
    }

    func load(from URLString: String, placeHolder: UIImage? = nil) {
        image = placeHolder
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            image = cachedImage
            return
        }

        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
                if error != nil {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            self?.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }

    func download(from urlString: String?, showLoadingIndicator: Bool) {
        guard let urlString = urlString else {
            return
        }

        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            image = cachedImage
            return
        }

        var spinner: UIActivityIndicatorView?
        if showLoadingIndicator {
            DispatchQueue.main.async {
                let indicator = UIActivityIndicatorView()
                indicator.startAnimating()
                indicator.style = .medium

                self.addSubview(indicator)
                indicator.pinCenter()

                spinner = indicator
            }
        }

        let removeSpinner = {
            spinner?.stopAnimating()
            spinner?.removeFromSuperview()
        }

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
                if error != nil {
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
                            self?.image = downloadedImage
                            removeSpinner()
                        }
                    }
                }
            }).resume()
        }
    }
}
