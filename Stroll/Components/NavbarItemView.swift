// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct NavbarItemView: View {
    let data: NavbarItem
    
    init(_ data: NavbarItem) {
        self.data = data
    }
    
    var body: some View {
        VStack(spacing: 4) {
            if data.isProfile {
                Image(.Icons.cirularStroke)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .overlay {
                        data.image
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                    }
            } else {
                data.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .overlay {
                        if let badgeCount = data.badgeCount {
                            HStack {
                                Spacer()
                                
                                VStack {
                                    Capsule()
                                        .fill(Color(hex: "#B5B2FF"))
                                        .stroke(Color(hex: "#111315"), style: .init(lineWidth: 1.4))
                                        .frame(width: 16, height: 13)
                                        .overlay {
                                            Text(String(badgeCount))
                                                .font(token: .custom(size: 7, weight: .bold))
                                                .foregroundStyle(BackgroundColor.primary.color)
                                        }
                                        .padding(.trailing, -8)
                                        .padding(.top, -4)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
            }
            
            Text(data.isProfile ? "Profile" : data.label)
                .font(token: .custom(size: 10, weight: .semibold))
                .foreground(token: .custom(hex: data.isSelected ? "#B5B2FF" : "#5F5F60"))
        }
        .padding([.horizontal, .top], 6)
        .padding(.bottom, 2)
    }
}
