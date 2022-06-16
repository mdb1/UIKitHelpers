// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitHelpers",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "UIKitHelpers",
            targets: ["UIKitHelpers"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UIKitHelpers",
            dependencies: []
        ),
        .testTarget(
            name: "UIKitHelpersTests",
            dependencies: ["UIKitHelpers"]
        )
    ]
)
