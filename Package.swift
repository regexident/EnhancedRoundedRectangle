// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EnhancedRoundedRectangle",
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
