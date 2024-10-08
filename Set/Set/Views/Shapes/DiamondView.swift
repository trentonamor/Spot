//
//  Diamond.swift
//  Set
//
//  Created by Trenton Parrotte on 9/18/24.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY ))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.closeSubpath()
        }
    }
}

struct DiamondView: ShapeView {
    var color: Color
    var shading: SetGameModel.Shading
    
    var body: some View {
        Group {
            switch shading {
                case .empty:
                    Diamond()
                        .stroke(color, lineWidth: 2.0)
                        .aspectRatio(2.0, contentMode: .fit)
                case .filled:
                    Diamond()
                        .fill(color)
                        .aspectRatio(2.0, contentMode: .fit)
                case .lined:
                    Diamond()
                        .stroke(color, lineWidth: 2.0)
                        .linedFill(lineColor: color, shape: Diamond())
                        .aspectRatio(2.0, contentMode: .fit)
            }
        }

    }
}

#Preview {
    VStack {
        DiamondView(color: .dynamicGreen, shading: .lined)
        DiamondView(color: .dynamicGreen, shading: .empty)
        DiamondView(color: .dynamicGreen, shading: .filled)
    }
    .padding()
}
