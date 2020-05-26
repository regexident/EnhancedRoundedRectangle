import XCTest

import SwiftUI
import SnapshotTesting

@testable import EnhancedRoundedRectangle

final class EnhancedRoundedRectangleTests: XCTestCase {
    /// size large enough for provided corner radii:
    func testNormal() {
        #if os(iOS)

        let styles: [RoundedCornerStyle] = [.circular, .continuous]

        for style in styles {
            let view: some View = EnhancedRoundedRectangle(
                cornerRadius: .init(
                    topLeft: 10.0,
                    topRight: 20.0,
                    bottomRight: 30.0,
                    bottomLeft: 40.0
                ),
                style: style
            )
                .fill(Color.gray)
                .padding(5.0)
                .frame(width: 100.0, height: 100.0)

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
    func testOverflow() {
        #if os(iOS)

        let styles: [RoundedCornerStyle] = [.circular, .continuous]

        for style in styles {
            let view: some View = EnhancedRoundedRectangle(
                cornerRadius: .init(
                    topLeft: 10.0,
                    topRight: 20.0,
                    bottomRight: 30.0,
                    bottomLeft: 40.0
                ),
                style: style
            )
                .fill(Color.gray)
                .padding(5.0)
                .frame(width: 50.0, height: 50.0)

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
        ("testNormal", testNormal),
        ("testOverflow", testOverflow),
    ]
}
