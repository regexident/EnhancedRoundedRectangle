// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

internal struct EnhancedContinuousRoundedRectangle: Shape {
    private static let ellipseCoefficient: CGFloat = 1.28195

    internal let cornerRadius: CornerRadius

    internal func path(in rect: CGRect) -> Path {
        var path = Path()

        let cornerRadius = self.cornerRadius.minimum(
            for: rect,
            scaleFactor: Self.ellipseCoefficient
        )

        let coefficients: [CGFloat] = [
            0.04641, 0.08715, 0.13357, 0.16296, 0.21505, 0.290086, 0.32461, 0.37801, 0.44576, 0.6074, 0.77037
        ]

        let topRightP1 = CGPoint(
            x: rect.width - cornerRadius.topRight * Self.ellipseCoefficient,
            y: rect.origin.y
        )
        let topRightP1CP1 = CGPoint(
            x: topRightP1.x + cornerRadius.topRight * coefficients[8],
            y: topRightP1.y
        )
        let topRightP1CP2 = CGPoint(
            x: topRightP1.x + cornerRadius.topRight * coefficients[9],
            y: topRightP1.y + cornerRadius.topRight * coefficients[0]
        )

        let topRightP2 = CGPoint(
            x: topRightP1.x + cornerRadius.topRight * coefficients[10],
            y: topRightP1.y + cornerRadius.topRight * coefficients[2]
        )
        let topRightP2CP1 = CGPoint(
            x: topRightP2.x + cornerRadius.topRight * coefficients[3],
            y: topRightP2.y + cornerRadius.topRight * coefficients[1]
        )
        let topRightP2CP2 = CGPoint(
            x: topRightP2.x + cornerRadius.topRight * coefficients[5],
            y: topRightP2.y + cornerRadius.topRight * coefficients[4]
        )

        let topRightP3 = CGPoint(x:
            topRightP2.x + cornerRadius.topRight * coefficients[7],
            y: topRightP2.y + cornerRadius.topRight * coefficients[7]
        )
        let topRightP3CP1 = CGPoint(
            x: topRightP3.x + cornerRadius.topRight * coefficients[1],
            y: topRightP3.y + cornerRadius.topRight * coefficients[3]
        )
        let topRightP3CP2 = CGPoint(
            x: topRightP3.x + cornerRadius.topRight * coefficients[2],
            y: topRightP3.y + cornerRadius.topRight * coefficients[6]
        )

        let topRightP4 = CGPoint(
            x: topRightP3.x + cornerRadius.topRight * coefficients[2],
            y: topRightP3.y + cornerRadius.topRight * coefficients[10]
        )

        let bottomRightP1 = CGPoint(
            x: rect.width,
            y: rect.height - cornerRadius.bottomRight * Self.ellipseCoefficient
        )
        let bottomRightP1CP1 = CGPoint(
            x: bottomRightP1.x,
            y: bottomRightP1.y + cornerRadius.bottomRight * coefficients[8]
        )
        let bottomRightP1CP2 = CGPoint(
            x: bottomRightP1.x - cornerRadius.bottomRight * coefficients[0],
            y: bottomRightP1.y + cornerRadius.bottomRight * coefficients[9]
        )

        let bottomRightP2 = CGPoint(
            x: bottomRightP1.x - cornerRadius.bottomRight * coefficients[2],
            y: bottomRightP1.y + cornerRadius.bottomRight * coefficients[10]
        )
        let bottomRightP2CP1 = CGPoint(
            x: bottomRightP2.x - cornerRadius.bottomRight * coefficients[1],
            y: bottomRightP2.y + cornerRadius.bottomRight * coefficients[3]
        )
        let bottomRightP2CP2 = CGPoint(
            x: bottomRightP2.x - cornerRadius.bottomRight * coefficients[4],
            y: bottomRightP2.y + cornerRadius.bottomRight * coefficients[5]
        )

        let bottomRightP3 = CGPoint(
            x: bottomRightP2.x - cornerRadius.bottomRight * coefficients[7],
            y: bottomRightP2.y + cornerRadius.bottomRight * coefficients[7]
        )
        let bottomRightP3CP1 = CGPoint(
            x: bottomRightP3.x - cornerRadius.bottomRight * coefficients[3],
            y: bottomRightP3.y + cornerRadius.bottomRight * coefficients[1]
        )
        let bottomRightP3CP2 = CGPoint(
            x: bottomRightP3.x - cornerRadius.bottomRight * coefficients[6],
            y: bottomRightP3.y + cornerRadius.bottomRight * coefficients[2]
        )

        let bottomRightP4 = CGPoint(
            x: bottomRightP3.x - cornerRadius.bottomRight * coefficients[10],
            y: bottomRightP3.y + cornerRadius.bottomRight * coefficients[2]
        )

        let bottomLeftP1 = CGPoint(
            x: rect.origin.x + cornerRadius.bottomLeft * Self.ellipseCoefficient,
            y: rect.height
        )
        let bottomLeftP1CP1 = CGPoint(
            x: bottomLeftP1.x - cornerRadius.bottomLeft * coefficients[8],
            y: bottomLeftP1.y
        )
        let bottomLeftP1CP2 = CGPoint(
            x: bottomLeftP1.x - cornerRadius.bottomLeft * coefficients[9],
            y: bottomLeftP1.y - cornerRadius.bottomLeft * coefficients[0]
        )

        let bottomLeftP2 = CGPoint(
            x: bottomLeftP1.x - cornerRadius.bottomLeft * coefficients[10],
            y: bottomLeftP1.y - cornerRadius.bottomLeft * coefficients[2]
        )
        let bottomLeftP2CP1 = CGPoint(
            x: bottomLeftP2.x - cornerRadius.bottomLeft * coefficients[3],
            y: bottomLeftP2.y - cornerRadius.bottomLeft * coefficients[1]
        )
        let bottomLeftP2CP2 = CGPoint(
            x: bottomLeftP2.x - cornerRadius.bottomLeft * coefficients[5],
            y: bottomLeftP2.y - cornerRadius.bottomLeft * coefficients[4]
        )

        let bottomLeftP3 = CGPoint(
            x: bottomLeftP2.x - cornerRadius.bottomLeft * coefficients[7],
            y: bottomLeftP2.y - cornerRadius.bottomLeft * coefficients[7]
        )
        let bottomLeftP3CP1 = CGPoint(
            x: bottomLeftP3.x - cornerRadius.bottomLeft * coefficients[1],
            y: bottomLeftP3.y - cornerRadius.bottomLeft * coefficients[3]
        )
        let bottomLeftP3CP2 = CGPoint(
            x: bottomLeftP3.x - cornerRadius.bottomLeft * coefficients[2],
            y: bottomLeftP3.y - cornerRadius.bottomLeft * coefficients[6]
        )

        let bottomLeftP4 = CGPoint(
            x: bottomLeftP3.x - cornerRadius.bottomLeft * coefficients[2],
            y: bottomLeftP3.y - cornerRadius.bottomLeft * coefficients[10]
        )

        let topLeftP1 = CGPoint(
            x: rect.origin.x,
            y: rect.origin.y + cornerRadius.topLeft * Self.ellipseCoefficient
        )
        let topLeftP1CP1 = CGPoint(
            x: topLeftP1.x,
            y: topLeftP1.y - cornerRadius.topLeft * coefficients[8]
        )
        let topLeftP1CP2 = CGPoint(
            x: topLeftP1.x + cornerRadius.topLeft * coefficients[0],
            y: topLeftP1.y - cornerRadius.topLeft * coefficients[9]
        )

        let topLeftP2 = CGPoint(
            x: topLeftP1.x + cornerRadius.topLeft * coefficients[2],
            y: topLeftP1.y - cornerRadius.topLeft * coefficients[10]
        )
        let topLeftP2CP1 = CGPoint(
            x: topLeftP2.x + cornerRadius.topLeft * coefficients[1],
            y: topLeftP2.y - cornerRadius.topLeft * coefficients[3]
        )
        let topLeftP2CP2 = CGPoint(
            x: topLeftP2.x + cornerRadius.topLeft * coefficients[4],
            y: topLeftP2.y - cornerRadius.topLeft * coefficients[5]
        )

        let topLeftP3 = CGPoint(
            x: topLeftP2.x + cornerRadius.topLeft * coefficients[7],
            y: topLeftP2.y - cornerRadius.topLeft * coefficients[7]
        )
        let topLeftP3CP1 = CGPoint(
            x: topLeftP3.x + cornerRadius.topLeft * coefficients[3],
            y: topLeftP3.y - cornerRadius.topLeft * coefficients[1]
        )
        let topLeftP3CP2 = CGPoint(
            x: topLeftP3.x + cornerRadius.topLeft * coefficients[6],
            y: topLeftP3.y - cornerRadius.topLeft * coefficients[2]
        )

        let topLeftP4 = CGPoint(
            x: topLeftP3.x + cornerRadius.topLeft * coefficients[10],
            y: topLeftP3.y - cornerRadius.topLeft * coefficients[2]
        )

        path.move(to: CGPoint(
            x: rect.origin.x + cornerRadius.topLeft * Self.ellipseCoefficient,
            y: rect.origin.y
        ))

        // Top right
        path.addLine(to: topRightP1)
        path.addCurve(to: topRightP2, control1: topRightP1CP1, control2: topRightP1CP2)
        path.addCurve(to: topRightP3, control1: topRightP2CP1, control2: topRightP2CP2)
        path.addCurve(to: topRightP4, control1: topRightP3CP1, control2: topRightP3CP2)

        // Bottom right
        path.addLine(to: bottomRightP1)
        path.addCurve(to: bottomRightP2, control1: bottomRightP1CP1, control2: bottomRightP1CP2)
        path.addCurve(to: bottomRightP3, control1: bottomRightP2CP1, control2: bottomRightP2CP2)
        path.addCurve(to: bottomRightP4, control1: bottomRightP3CP1, control2: bottomRightP3CP2)

        // Bottom left
        path.addLine(to: bottomLeftP1)
        path.addCurve(to: bottomLeftP2, control1: bottomLeftP1CP1, control2: bottomLeftP1CP2)
        path.addCurve(to: bottomLeftP3, control1: bottomLeftP2CP1, control2: bottomLeftP2CP2)
        path.addCurve(to: bottomLeftP4, control1: bottomLeftP3CP1, control2: bottomLeftP3CP2)

        // Top Left
        path.addLine(to: topLeftP1)
        path.addCurve(to: topLeftP2, control1: topLeftP1CP1, control2: topLeftP1CP2)
        path.addCurve(to: topLeftP3, control1: topLeftP2CP1, control2: topLeftP2CP2)
        path.addCurve(to: topLeftP4, control1: topLeftP3CP1, control2: topLeftP3CP2)

        return path
    }
}

struct EnhancedContinuousRoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        EnhancedCircularRoundedRectangle(
            cornerRadius: .init(
                topLeft: 10.0,
                topRight: 20.0,
                bottomRight: 30.0,
                bottomLeft: 40.0
            )
        )
            .fill(Color.gray)
            .frame(width: 100.0, height: 100.0)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

// Based on: https://github.com/everdrone/react-native-super-ellipse-mask
//
// MIT License
//
// Copyright (c) 2018 Giorgio Tropiano
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
