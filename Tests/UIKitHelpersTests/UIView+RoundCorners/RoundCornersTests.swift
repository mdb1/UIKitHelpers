//
//  RoundCornersTests.swift
//
//
//  Created by Manu on 20/05/2022.
//

@testable import UIKitHelpers
import XCTest

final class RoundCornersTests: XCTestCase {
    private enum Constant {
        static let cornerRadius: CGFloat = 4
        static let containerHeight = 20
        static let containerWidth = 20
    }

    private var containerView: UIView!

    override func setUp() {
        super.setUp()

        containerView = UIView(
            frame: CGRect(x: 0, y: 0, width: Constant.containerWidth, height: Constant.containerHeight)
        )
    }

    override func tearDown() {
        defer { super.tearDown() }

        containerView = nil
    }

    func testCornerRadius() {
        // Given
        XCTAssertNotNil(containerView)
        containerView.forceLayoutSubviews()
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(with: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(
            containerView.layer.maskedCorners,
            [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]
        )
    }

    func testRound() {
        // Given
        XCTAssertNotNil(containerView)
        containerView.forceLayoutSubviews()
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round()

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, 10)
        XCTAssertEqual(
            containerView.layer.maskedCorners,
            [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]
        )
    }

    func testRoundTopLeftCorner() {
        // Given
        XCTAssertNotNil(containerView)
        containerView.forceLayoutSubviews()
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(corners: [.topLeft], radius: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.maskedCorners, [.layerMinXMinYCorner])
    }

    func testRoundTopRightCorner() {
        // Given
        XCTAssertNotNil(containerView)
        containerView.forceLayoutSubviews()
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(corners: [.topRight], radius: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.maskedCorners, [.layerMaxXMinYCorner])
    }

    func testRoundBottomLeftCorner() {
        // Given
        XCTAssertNotNil(containerView)
        containerView.forceLayoutSubviews()
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(corners: [.bottomLeft], radius: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.maskedCorners, [.layerMinXMaxYCorner])
    }

    func testRoundBottomRightCorner() {
        // Given
        XCTAssertNotNil(containerView)
        containerView.forceLayoutSubviews()
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(corners: [.bottomRight], radius: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.maskedCorners, [.layerMaxXMaxYCorner])
    }
}
