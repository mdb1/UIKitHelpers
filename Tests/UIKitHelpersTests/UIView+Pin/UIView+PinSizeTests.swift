@testable import UIKitHelpers
import XCTest

final class UIViewPinSizeTests: XCTestCase {
    private enum Constant {
        static let containerWidth = 200
        static let containerHeight = 200
    }

    private var containerView: UIView!

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
    }

    override func tearDown() {
        defer { super.tearDown() }

        containerView = nil
    }

    func testPinSize() {
        // Given
        XCTAssertNotNil(containerView)

        let image = UIImageView()
        let size = CGSize(width: 50, height: 50)
        containerView.addSubview(image)
        XCTAssertEqual(image.superview, containerView)

        // When
        image.pinSize(size)
        containerView.forceLayoutSubviews()

        // Then
        // Size gets applied correctly
        XCTAssertEqual(image.frame.size, size)
    }

    func testPinSizeWithDimension() {
        // Given
        XCTAssertNotNil(containerView)

        let image = UIImageView()
        let dimension = 50.0
        let expectedSize = CGSize(width: 50, height: 50)
        containerView.addSubview(image)
        XCTAssertEqual(image.superview, containerView)

        // When
        image.pinSize(dimension)
        containerView.forceLayoutSubviews()

        // Then
        // Size gets applied correctly
        XCTAssertEqual(image.frame.size, expectedSize)
    }
}
