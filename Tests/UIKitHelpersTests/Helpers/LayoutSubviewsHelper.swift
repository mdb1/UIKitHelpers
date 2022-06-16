import UIKit

extension UIView {
    /// This method is used to forced the view and it's subviews to layout in the test target.
    func forceLayoutSubviews() {
        setNeedsLayout()
        layoutIfNeeded()
        subviews.forEach {
            $0.setNeedsLayout()
            $0.layoutIfNeeded()
        }
    }
}
