// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

internal struct EnhancedCircularRoundedRectangle: Shape {
    internal let cornerRadius: CornerRadius

    internal func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height

        let cornerRadius = self.cornerRadius.minimum(for: rect)

        path.move(to: CGPoint(
            x: width * 0.5,
            y: 0.0
        ))

        path.addLine(to: CGPoint(
            x: width - cornerRadius.topRight,
            y: 0.0
        ))
        path.addArc(
            center: CGPoint(
                x: width - cornerRadius.topRight,
                y: cornerRadius.topRight
            ),
            radius: cornerRadius.topRight,
            startAngle: Angle(degrees: -90.0),
            endAngle: Angle(degrees: 0.0),
            clockwise: false
        )

        path.addLine(to: CGPoint(
            x: width,
            y: height - cornerRadius.bottomRight
        ))
        path.addArc(
            center: CGPoint(
                x: width - cornerRadius.bottomRight,
                y: height - cornerRadius.bottomRight
            ),
            radius: cornerRadius.bottomRight,
            startAngle: Angle(degrees: 0.0),
            endAngle: Angle(degrees: 90.0),
            clockwise: false
        )

        path.addLine(to: CGPoint(
            x: cornerRadius.bottomLeft,
            y: height
        ))
        path.addArc(
            center: CGPoint(
                x: cornerRadius.bottomLeft,
                y: height - cornerRadius.bottomLeft
            ),
            radius: cornerRadius.bottomLeft,
            startAngle: Angle(degrees: 90.0),
            endAngle: Angle(degrees: 180.0),
            clockwise: false
        )

        path.addLine(to: CGPoint(
            x: 0.0,
            y: cornerRadius.topLeft
        ))
        path.addArc(
            center: CGPoint(
                x: cornerRadius.topLeft,
                y: cornerRadius.topLeft
            ),
            radius: cornerRadius.topLeft,
            startAngle: Angle(degrees: 180.0),
            endAngle: Angle(degrees: 270.0),
            clockwise: false
        )

        return path
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
            )
        )
            .fill(Color.gray)
            .frame(width: 100.0, height: 100.0)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
