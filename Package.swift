// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EnhancedRoundedRectangle",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "EnhancedRoundedRectangle",
            targets: [
                "EnhancedRoundedRectangle",
            ]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "EnhancedRoundedRectangle",
            dependencies: [
            ]
        ),
        .testTarget(
            name: "EnhancedRoundedRectangleTests",
            dependencies: [
                "EnhancedRoundedRectangle",
            ]
        ),
    ]
)
