// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct ChatView: View {
    let data: Chat
    
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            data.avatarImage
                .resizable()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
            
            VStack(spacing: 8) {
                HStack {
                    VStack(spacing: 2) {
                        HStack {
                            Text(data.name)
                                .font(token: .custom(size: 16, weight: .bold))
                                .foreground(token: .primary)
                            
                            if data.isNewChat {
                                HStack(spacing: 6) {
                                    Circle()
                                        .fill(ForegroundColor.primary.color)
                                        .frame(width: 5)
                                    
                                    Text("New Chat")
                                        .font(token: .custom(size: 10, weight: .semibold))
                                        .foreground(token: .primary)
                                }
                                .padding(.horizontal, 8)
                                .frame(height: 16)
                                .background(token: .custom(hex: "#42406F"), opacity: 0.8)
                                .clipShape(Capsule())
                            } else if data.isYourMove {
                                HStack(spacing: 6) {
                                    
                                    Text("Your move")
                                        .font(token: .custom(size: 10, weight: .semibold))
                                        .foreground(token: .primary)
                                }
                                .padding(.horizontal, 8)
                                .frame(height: 16)
                                .background(token: .custom(hex: "#282828"), opacity: 0.8)
                                .clipShape(Capsule())
                            }
                            
                            Spacer()
                        }
                        
                        if let voiceNoteDuration = data.voiceNoteDuration {
                            HStack(spacing: 12) {
                                Image(.Icons.wave)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 18)
                                
                                Text(voiceNoteDuration)
                                    .font(token: .custom(size: 14, weight: .bold))
                                    .foregroundStyle(
                                        LinearGradient(colors: [
                                            Color(hex: "#8669A8"),
                                            Color(hex: "#8669A8"),
                                            Color(hex: "#8669A8"),
                                            Color(hex: "#B5B2FF"),
                                        ], startPoint: .top, endPoint: .bottom)
                                    )
                                Spacer()
                            }
                            .padding(.vertical, 4)
                        } else {
                            HStack {
                                Text(data.message)
                                    .font(token: .custom(size: 14, weight: data.isUnread ? .semibold : .regular))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foreground(token: data.isUnread ? .primary : .muted)
                                
                                Spacer()
                            }
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    
                    VStack(alignment: .trailing, spacing: 5) {
                        Text(data.timestamp)
                            .font(token: .custom(size: 12, weight: .semibold))
                            .foreground(token: .custom(hex: data.isUnread ? "#555390" : "#A8AFB7"))
                        
                        if data.isFavorite || data.messageCount > 1 {
                            Capsule()
                                .fill(Color(hex: "#B5B2FF"))
                                .frame(width: 18, height: 14)
                                .overlay {
                                    if data.isFavorite {
                                        Image(.Icons.star)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 10)
                                    } else {
                                        Text(String(data.messageCount))
                                            .font(token: .custom(size: 10, weight: .bold))
                                            .foregroundStyle(BackgroundColor.primary.color)
                                    }
                                }
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .padding(.leading, 8)
                
                Rectangle()
                    .fill(Color(hex: "#292B2E"))
                    .frame(height: 1)
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}
