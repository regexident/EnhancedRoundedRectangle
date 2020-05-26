import XCTest

import SwiftUI
import SnapshotTesting

@testable import EnhancedRoundedRectangle

final class EnhancedRoundedRectangleTests: XCTestCase {
    func testFillFitting() {
        #if os(iOS)

        let styles: [RoundedCornerStyle] = [.circular, .continuous]

        for style in styles {
            let rectangle = EnhancedRoundedRectangle(
                cornerRadius: .init(
                    topLeft: 10.0,
                    topRight: 20.0,
                    bottomRight: 30.0,
                    bottomLeft: 40.0
                ),
                style: style
            )

            /// size large enough for provided corner radii:
            let size: CGFloat = 100.0

            let view: some View = rectangle
                .fill(Color.gray)
                .padding(5.0)
                .frame(width: size, height: size)

            // record = true
            assertSnapshot(
                matching: view,
                as: .image(
                    layout: .sizeThatFits,
                    traits: .init(userInterfaceStyle: .light)
                ),
                named: String(describing: style)
            )
        }

        #endif
    }


    func testFillOverflowing() {
        #if os(iOS)

        let styles: [RoundedCornerStyle] = [.circular, .continuous]

        for style in styles {
            let rectangle = EnhancedRoundedRectangle(
                cornerRadius: .init(
                    topLeft: 10.0,
                    topRight: 20.0,
                    bottomRight: 30.0,
                    bottomLeft: 40.0
                ),
                style: style
            )

            /// size too small for provided corner radii:
            let size: CGFloat = 50.0

            let view: some View = rectangle
                .fill(Color.gray)
                .padding(5.0)
                .frame(width: size, height: size)

            // record = true
            assertSnapshot(
                matching: view,
                as: .image(
                    layout: .sizeThatFits,
                    traits: .init(userInterfaceStyle: .light)
                ),
                named: String(describing: style)
            )
        }

        #endif
    }

    func testStrokeBorderFitting() {
        #if os(iOS)

        let styles: [RoundedCornerStyle] = [.circular, .continuous]

        for style in styles {
            let rectangle = EnhancedRoundedRectangle(
                cornerRadius: .init(
                    topLeft: 10.0,
                    topRight: 20.0,
                    bottomRight: 30.0,
                    bottomLeft: 40.0
                ),
                style: style
            )

            /// size large enough for provided corner radii:
            let size: CGFloat = 100.0
            let lineWidth: CGFloat = 0.1 * size

            let view = rectangle
                .strokeBorder(Color.black.opacity(0.25), lineWidth: lineWidth)
                .background(
                    rectangle.fill(Color.gray)
                )
                .padding(10.0)
                .frame(width: size + lineWidth, height: size + lineWidth)

            // record = true
            assertSnapshot(
                matching: view,
                as: .image(
                    layout: .sizeThatFits,
                    traits: .init(userInterfaceStyle: .light)
                ),
                named: String(describing: style)
            )
        }

        #endif
    }

    /// size too small for provided corner radii:
    func testStrokeBorderOverflowing() {
        #if os(iOS)

        let styles: [RoundedCornerStyle] = [.circular, .continuous]

        for style in styles {
            let rectangle = EnhancedRoundedRectangle(
                cornerRadius: .init(
                    topLeft: 10.0,
                    topRight: 20.0,
                    bottomRight: 30.0,
                    bottomLeft: 40.0
                ),
                style: style
            )

            /// size too small for provided corner radii:
            let size: CGFloat = 50.0
            let lineWidth: CGFloat = 0.1 * size

            let view = rectangle
                .strokeBorder(Color.black.opacity(0.25), lineWidth: lineWidth)
                .background(
                    rectangle.fill(Color.gray)
                )
                .padding(10.0)
                .frame(width: size + lineWidth, height: size + lineWidth)

            // record = true
            assertSnapshot(
                matching: view,
                as: .image(
                    layout: .sizeThatFits,
                    traits: .init(userInterfaceStyle: .light)
                ),
                named: String(describing: style)
            )
        }

        #endif
    }

    static var allTests = [
        ("testFillFitting", testFillFitting),
        ("testFillOverflowing", testFillOverflowing),
        ("testStrokeBorderFitting", testStrokeBorderFitting),
        ("testStrokeBorderOverflowing", testStrokeBorderOverflowing),
    ]
}
