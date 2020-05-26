// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

internal struct EnhancedCircularRoundedRectangle: Shape {
    internal let cornerRadius: CornerRadius

    private let offset: CGFloat

    internal init(cornerRadius: CornerRadius, offset: CGFloat) {
        self.cornerRadius = cornerRadius
        self.offset = offset
    }

    private func rectFor(rect: CGRect) -> CGRect {
        let inset = -self.offset
        return rect.insetBy(dx: inset, dy: inset)
    }

    private func cornerRadiusFor(rect: CGRect) -> CornerRadius {
        self.cornerRadius
            .minimum(for: rect)
            .offset(by: self.offset)
    }

    // swiftlint:disable:next function_body_length
    internal func path(in rect: CGRect) -> Path {
        var path = Path()

        let cornerRadius = self.cornerRadiusFor(rect: rect)
        let rect = self.rectFor(rect: rect)

        let x = rect.origin.x
        let y = rect.origin.y
        let width = rect.size.width
        let height = rect.size.height

        path.addLine(to: CGPoint(
            x: x + width - cornerRadius.topRight,
            y: y + 0.0
        ))
        path.addArc(
            center: CGPoint(
                x: x + width - cornerRadius.topRight,
                y: y + cornerRadius.topRight
            ),
            radius: cornerRadius.topRight,
            startAngle: Angle(degrees: -90.0),
            endAngle: Angle(degrees: 0.0),
            clockwise: false
        )

        path.addLine(to: CGPoint(
            x: x + width,
            y: y + height - cornerRadius.bottomRight
        ))
        path.addArc(
            center: CGPoint(
                x: x + width - cornerRadius.bottomRight,
                y: y + height - cornerRadius.bottomRight
            ),
            radius: cornerRadius.bottomRight,
            startAngle: Angle(degrees: 0.0),
            endAngle: Angle(degrees: 90.0),
            clockwise: false
        )

        path.addLine(to: CGPoint(
            x: x + cornerRadius.bottomLeft,
            y: y + height
        ))
        path.addArc(
            center: CGPoint(
                x: x + cornerRadius.bottomLeft,
                y: y + height - cornerRadius.bottomLeft
            ),
            radius: cornerRadius.bottomLeft,
            startAngle: Angle(degrees: 90.0),
            endAngle: Angle(degrees: 180.0),
            clockwise: false
        )

        path.addLine(to: CGPoint(
            x: x + 0.0,
            y: y + cornerRadius.topLeft
        ))
        path.addArc(
            center: CGPoint(
                x: x + cornerRadius.topLeft,
                y: y + cornerRadius.topLeft
            ),
            radius: cornerRadius.topLeft,
            startAngle: Angle(degrees: 180.0),
            endAngle: Angle(degrees: 270.0),
            clockwise: false
        )

        path.closeSubpath()
        
        return path
    }
}

extension EnhancedCircularRoundedRectangle: InsettableShape {
    typealias InsetShape = Self

    func inset(by amount: CGFloat) -> Self {
        Self(
            cornerRadius: self.cornerRadius,
            offset: self.offset - amount
        )
    }
}

struct EnhancedCircularRoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        EnhancedCircularRoundedRectangle(
            cornerRadius: .init(
                topLeft: 10.0,
                topRight: 20.0,
                bottomRight: 30.0,
                bottomLeft: 40.0
            ),
            offset: 0.0
        )
            .fill(Color.gray)
            .frame(width: 100.0, height: 100.0)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
