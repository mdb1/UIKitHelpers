@testable import UIKitHelpers
import XCTest

final class UIViewPinEdgesTests: XCTestCase {
    private enum Constant {
        static let containerWidth = 200
        static let containerHeight = 200
    }

    private var containerView: UIView!
    private var imageView: UIImageView!

    override func setUp() {
        super.setUp()

        containerView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: Constant.containerWidth,
                height: Constant.containerHeight
            )
        )
        imageView = UIImageView()
        containerView.addSubview(imageView)
    }

    override func tearDown() {
        defer { super.tearDown() }

        containerView = nil
        imageView = nil
    }

    func testPinAllEdges() {
        // Given
        XCTAssertNotNil(containerView)
        XCTAssertNotNil(imageView)

        // When
        imageView.pinEdges(.all)
        containerView.forceLayoutSubviews()

        // Then
        XCTAssertEqual(imageView.frame.size, containerView.frame.size)
    }

    func testPinAllEdgesToMargins() {
        // Given
        XCTAssertNotNil(containerView)
        XCTAssertNotNil(imageView)
        let margin = 20.0
        containerView.layoutMargins = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        let expectedSize = CGSize(
            width: 160, // 200 initially - 20 (left) - 20 (right)
            height: 160 // 200 initially - 20 (top) - 20 (bottom)
        )

        // When
        imageView.pinEdgesToMargins()
        containerView.forceLayoutSubviews()

        // Then
        XCTAssertEqual(imageView.frame.size, expectedSize)
    }

    func testPinMargins() {
        // Given
        XCTAssertNotNil(containerView)
        XCTAssertNotNil(imageView)
        containerView.layoutMargins = .zero
        let imageViewMargin = 10.0
        imageView.layoutMargins = UIEdgeInsets(
            top: imageViewMargin, left: imageViewMargin, bottom: imageViewMargin, right: imageViewMargin
        )
        let expectedSize = CGSize(
            width: 220, // 200 initially + 10 (left) + 10 (right)
            height: 220 // 200 initially + 10 (top) + 10 (bottom)
        )

        // When
        imageView.pinMargins()
        containerView.forceLayoutSubviews()

        // Then
        XCTAssertEqual(imageView.frame.size, expectedSize)
    }
}
