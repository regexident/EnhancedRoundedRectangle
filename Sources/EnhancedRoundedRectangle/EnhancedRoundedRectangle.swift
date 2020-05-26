// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

public struct EnhancedRoundedRectangle: Shape {
    public let cornerRadius: CornerRadius
    public let style: RoundedCornerStyle

    public init(
        cornerRadius: CornerRadius,
        style: RoundedCornerStyle = .circular
    ) {
        self.cornerRadius = cornerRadius
        self.style = style
    }

    public func path(in rect: CGRect) -> Path {
        typealias Circular = EnhancedCircularRoundedRectangle
        typealias Continuous = EnhancedContinuousRoundedRectangle

        switch style {
        case .circular:
            return Circular(cornerRadius: self.cornerRadius).path(in: rect)
        case .continuous:
            return Continuous(cornerRadius: self.cornerRadius).path(in: rect)
        @unknown default:
            return Circular(cornerRadius: self.cornerRadius).path(in: rect)
        }
    }
}

struct EnhancedRoundedRectangle_Previews: PreviewProvider {
    static var roundedCornerStyles: [RoundedCornerStyle] = [
        .circular, .continuous
    ]

    static var previews: some View {
        Group {
            ForEach(self.roundedCornerStyles, id: \.self) { style in
                EnhancedRoundedRectangle(
                    cornerRadius: .init(
                        topLeft: 10.0,
                        topRight: 20.0,
                        bottomRight: 30.0,
                        bottomLeft: 40.0
                    ),
                    style: style
                )
                    .fill(Color.gray)
                    .previewDisplayName("\(style)")
            }
        }
            .frame(width: 100.0, height: 100.0)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
