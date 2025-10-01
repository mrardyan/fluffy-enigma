// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct ProfileAvatarView: View {
    var body: some View {
        VStack {
            Image(.Avatar._1)
                .resizable()
                .clipShape(Circle())
                .frame(width: 35, height: 35, alignment: .center)
                .shadow(color: .black.opacity(0.6), radius: 2.3, x: 0, y: 4.6)
                .overlay {
                    CircularProgressBar()
                        .padding(-4)
                }
                .background {
                    Circle()
                        .fill(Accent.primary.color)
                        .frame(width: 45, height: 45)
                        .blur(radius: 25)
                        .opacity(0.25)
                }
            
            Capsule(style: .circular)
                .fill(Color(hex: "#12161F"))
                .frame(width: 42, height: 18)
                .overlay {
                    Text("90")
                        .font(token: .custom(size: 11, weight: .bold))
                        .foreground(token: .primary)
                }
                .padding(.top, -12)
        }
    }
}

struct CircularProgressBar: View {
    var progress = 0.5833
    var progressOffset = 0.6667
    var startAngle: Double = 150
    
    var lineWidth: CGFloat = 3
    var progressColor: Color = .green
    var offsetColor: Color = Color(hex: "#363636")
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let radius = size / 2
            let angle = Angle(degrees: startAngle + (Double(progress) * 360))
            let markerX = radius + cos(angle.radians) * (radius - lineWidth/8)
            let markerY = radius + sin(angle.radians) * (radius - lineWidth/2)
            
            ZStack {
                backgroundCircle
                progressCircle
                marker(x: markerX, y: markerY)
            }
        }
    }
}

// MARK: - Subviews
extension CircularProgressBar {
    @ViewBuilder
    private var backgroundCircle: some View {
        Circle()
            .trim(from: 0, to: progressOffset)
            .stroke(
                AngularGradient(
                    stops: [
                        .init(color: .clear, location: 0.0),
                        .init(color: .clear, location: 0.0001),
                        .init(color: offsetColor, location: 0.15),
                        .init(color: offsetColor, location: 1.0)
                    ],
                    center: .center,
                    angle: .degrees(360)
                ),
                style: StrokeStyle(lineWidth: lineWidth)
            )
            .rotationEffect(.degrees(startAngle))
    }
    
    @ViewBuilder
    private var progressCircle: some View {
        Circle()
            .trim(from: 0, to: progress)
            .stroke(
                AngularGradient(
                    stops: [
                        .init(color: .clear, location: 0.0),
                        .init(color: .clear, location: 0.0001),
                        .init(color: progressColor, location: 0.15),
                        .init(color: progressColor, location: 1.0)
                    ],
                    center: .center,
                    angle: .degrees(360)
                ),
                style: StrokeStyle(lineWidth: lineWidth)
            )
            .rotationEffect(.degrees(startAngle))
    }
    
    @ViewBuilder
    private func marker(x: CGFloat, y: CGFloat) -> some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .clear, location: 0.0),
                        .init(color: Accent.primary.color, location: 0.3),
                        .init(color: Accent.primary.color, location: 0.7),
                        .init(color: .clear, location: 1.0)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: lineWidth * 4, height: lineWidth * 0.6)
            .position(x: x, y: y)
            .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 0)
    }
}
