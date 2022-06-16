//
//  UIView+RandomizeColorsTests.swift
//
//
//  Created by Manu on 01/06/2022.
//

@testable import UIKitHelpers
import XCTest

final class RandomizeColorsTests: XCTestCase {
    private enum Constant {
        static let containerHeight = 20
        static let containerWidth = 20
        static let containerInitialColor = UIColor.white
        static let insideViewSize = CGSize(width: 10, height: 10)
        static let insideViewInitialColor = UIColor.black
    }

    private var containerView: UIView!
    private var insideView: UIView!

    override func setUp() {
        super.setUp()

        containerView = UIView(
            frame: CGRect(x: 0, y: 0, width: Constant.containerWidth, height: Constant.containerHeight)
        )
        containerView.backgroundColor = Constant.containerInitialColor
        insideView = UIView()
        insideView.pinSize(Constant.insideViewSize)
        insideView.backgroundColor = Constant.insideViewInitialColor
        containerView.addSubview(insideView)
        insideView.pinCenter()
    }

    override func tearDown() {
        defer { super.tearDown() }

        containerView = nil
        insideView = nil
    }

    func testCornerRadius() {
        // Given
        XCTAssertNotNil(containerView)
        XCTAssertNotNil(insideView)
        containerView.forceLayoutSubviews()
        XCTAssertTrue(insideView.superview === containerView)
        XCTAssertEqual(containerView.backgroundColor, Constant.containerInitialColor)
        XCTAssertEqual(insideView.backgroundColor, Constant.insideViewInitialColor)

        // When
        containerView.randomizeColors()

        // Then the colors are not the same as the initial ones
        XCTAssertNotEqual(containerView.backgroundColor, Constant.containerInitialColor)
        XCTAssertNotEqual(insideView.backgroundColor, Constant.insideViewInitialColor)
    }
}
