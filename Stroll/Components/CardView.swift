// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct CardView: View {
    let data: Card
    
    init(_ data: Card) {
        self.data = data
    }
    
    var body: some View {
        ZStack {
            ZStack {
                data.backgroundImage
                    .resizable()
                    .scaledToFill()
                    .blur(radius: data.isBlurred ? 25 : 0)
                    .frame(width: 145, height: 205)
                    .clipped()
                
                if data.isBlurred {
                    Text("Tap to answer")
                        .font(token: .custom(size: 10, weight: .bold))
                        .foregroundColor(Color(hex: "#A8AFB7"))
                }
            }
            
            VStack {
                if let remainingTime = data.remainingTime {
                    // Timer mode (contoh Binghan)
                    HStack {
                        Text("📣")
                            .font(token: .custom(size: 12, weight: .semibold))
                            .frame(width: 24, height: 24)
                            .background(token: .primary)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        Text(remainingTime)
                            .font(token: .custom(size: 6.2, weight: .bold))
                            .foreground(token: .primary)
                            .frame(width: 19, height: 19)
                            .background(token: .custom(hex: "#EDEDED"), opacity: 0.2)
                            .clipShape(Circle())
                            .background {
                                Circle()
                                    .fill(BackgroundColor.primary.color)
                                    .frame(width: 25, height: 25)
                                    .blur(radius: 25)
                                    .opacity(0.9)
                                    .shadow(color: BackgroundColor.primary.color.opacity(0.8), radius: 4, x: 0, y: 0)
                                    .frame(width: 24, height: 24)
                            }
                            .overlay {
                                Circle()
                                    .trim(from: 0, to: 0.6667) // progress stroke
                                    .stroke(
                                        Color(hex: "#D8D8D8"),
                                        style: StrokeStyle(lineWidth: 1.5, lineCap: .round)
                                    )
                                    .rotationEffect(.degrees(-90))
                            }
                        
                    }
                    .padding(.horizontal, 9)
                    .padding(.top, 9)
                } else if data.isMoveMade {
                    HStack {
                        Text("📣 They made a move!")
                            .font(token: .custom(size: 9, weight: .semibold))
                            .frame(height: 19)
                            .padding(.horizontal, 10)
                            .background(token: .primary)
                            .clipShape(Capsule())
                            .frame(maxWidth: .infinity)
                            .fixedSize(horizontal: true, vertical: false)
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 11)
                }
                
                Spacer()
                
                if !data.name.isEmpty {
                    VStack(spacing: 5) {
                        Text("\(data.name), \(data.age)")
                            .font(token: .custom(size: 15, weight: .bold))
                            .foreground(token: .primary)
                        
                        Text(data.question)
                            .font(token: .custom(size: 10, weight: .regular))
                            .foreground(token: .custom(hex: "#CFCFFE"))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 115)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 12)
                }
            }
            .background {
                VStack {
                    Spacer()
                    
                    LinearGradient(gradient:
                                    Gradient(colors: [
                                        Color(hex: "#0B0D0E"),
                                        Color(hex: "#0B0D0E")
                                            .opacity(0.8),
                                        Color(hex: "#0B0D0E")
                                            .opacity(0.4),
                                        Color.clear,
                                        Color.clear,
                                    ]),
                                   startPoint: .bottom, endPoint: .top)
                    .frame(height: 205)
                }
            }
        }
        .frame(width: 145, height: 205)
        .clipShape(
            RoundedRectangle(
                cornerSize: .init(width: 20,
                                  height: 20)
            )
        )
        .shadow(color: .black.opacity(0.25),
                radius: 2,
                x: 2,
                y: 4
        )
    }
}

extension CardView {
    struct MoreCard: View {
        let moreText = "+10"
        let images: [Image] = [
            Image(.BlurredAvatar._1),
            Image(.BlurredAvatar._2),
            Image(.BlurredAvatar._3),
        ]
        
        var body: some View {
            HStack {
                Text(moreText)
                    .font(token: .custom(size: 10, weight: .bold))
                    .frame(width: 26, height: 19)
                    .foreground(token: .primary)
                    .background(token: .primary)
                    .clipShape(Capsule())
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.horizontal, -6)
                    .zIndex(10)
                
                ForEach(Array(images.enumerated()), id: \.offset) { index, image in
                    image
                        .resizable()
                        .frame(width: 18, height: 18)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(BackgroundColor.primary.color, lineWidth: 1.5)
                        )
                        .padding(.horizontal, -6)
                        .zIndex(Double(9 - index))
                }
            }
            .frame(width: 90, height: 205)
            .background(token: .custom(hex: "#222222"))
            .clipShape(
                RoundedRectangle(
                    cornerSize: .init(width: 20,
                                      height: 20)
                )
            )
            .shadow(color: .black.opacity(0.25),
                    radius: 2,
                    x: 2,
                    y: 4
            )
        }
    }
}
