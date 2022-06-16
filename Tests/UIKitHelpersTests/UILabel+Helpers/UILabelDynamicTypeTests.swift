@testable import UIKitHelpers
import XCTest

final class UILabelDynamicTypeTests: XCTestCase {
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

    func testDynamicTypeNoLines() {
        // Given
        XCTAssertNotNil(containerView)

        let label = UILabel()
        containerView.addSubview(label)
        label.pinCenter()
        XCTAssertEqual(label.superview, containerView)
        XCTAssertFalse(label.adjustsFontForContentSizeCategory)

        // When
        label.supportDynamicType(size: 12, weight: .bold)

        // Then
        XCTAssertEqual(label.font, .systemFont(ofSize: 12, weight: .bold).scaled)
        XCTAssertTrue(label.adjustsFontForContentSizeCategory)
        XCTAssertEqual(label.numberOfLines, 0)
    }

    func testDynamicTypeOneLine() {
        // Given
        XCTAssertNotNil(containerView)

        let label = UILabel()
        containerView.addSubview(label)
        label.pinCenter()
        XCTAssertEqual(label.superview, containerView)
        XCTAssertFalse(label.adjustsFontForContentSizeCategory)

        // When
        label.supportDynamicType(size: 12, numberOfLines: 1)

        // Then
        XCTAssertEqual(label.font, .systemFont(ofSize: 12).scaled)
        XCTAssertTrue(label.adjustsFontForContentSizeCategory)
        XCTAssertEqual(label.numberOfLines, 1)
    }
}
