// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import CoreGraphics

public struct CornerRadius {
    public let topLeft: CGFloat
    public let topRight: CGFloat
    public let bottomRight: CGFloat
    public let bottomLeft: CGFloat

    public init(
        topLeft: CGFloat,
        topRight: CGFloat,
        bottomRight: CGFloat,
        bottomLeft: CGFloat
    ) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomRight = bottomRight
        self.bottomLeft = bottomLeft
    }

    public init(_ uniform: CGFloat) {
        self.init(
            topLeft: uniform,
            topRight: uniform,
            bottomRight: uniform,
            bottomLeft: uniform
        )
    }

    public func offset(by offset: CGFloat) -> Self {
        Self(
            topLeft: max(0.0, self.topLeft + offset),
            topRight: max(0.0, self.topRight + offset),
            bottomRight: max(0.0, self.bottomRight + offset),
            bottomLeft: max(0.0, self.bottomLeft + offset)
        )
    }

    internal func minimum(
        for rect: CGRect,
        scaleFactor: CGFloat = 1.0
    ) -> Self {
        func calculateMinimumRadius(
            width: CGFloat,
            height: CGFloat,
            radius: CGFloat
        ) -> CGFloat {
            let minSide = min(width, height)
            let minRadius = min(radius * scaleFactor, minSide)

            return minRadius / scaleFactor
        }

        let width = rect.width
        let height = rect.height

        // Avoid division by zero:
        let epsilon: CGFloat = .leastNormalMagnitude

        let top = (self.topLeft + self.topRight) + epsilon
        let right = (self.topRight + self.bottomRight) + epsilon
        let bottom = (self.bottomRight + self.bottomLeft) + epsilon
        let left = (self.bottomLeft + self.topLeft) + epsilon

        let minimumTopRight = calculateMinimumRadius(
            width: width / top * self.topRight,
            height: height / right * self.topRight,
            radius: self.topRight
        )
        let minimumBottomRight = calculateMinimumRadius(
            width: width / bottom * self.bottomRight,
            height: height / right * self.bottomRight,
            radius: self.bottomRight
        )
        let minimumBottomLeft = calculateMinimumRadius(
            width: width / bottom * self.bottomLeft,
            height: height / left * self.bottomLeft,
            radius: self.bottomLeft
        )
        let minimumTopLeft = calculateMinimumRadius(
            width: width / top * self.topLeft,
            height: height / left * self.topLeft,
            radius: self.topLeft
        )

        return .init(
            topLeft: minimumTopLeft,
            topRight: minimumTopRight,
            bottomRight: minimumBottomRight,
            bottomLeft: minimumBottomLeft
        )
    }
}
