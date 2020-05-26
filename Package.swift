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
        .package(
            name: "SnapshotTesting",
            url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
            .revision("4d9e7447dc5ce3b1ad3757cbf2d4387bf8e35934")
        ),
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
                "SnapshotTesting",
            ]
        ),
    ]
)
