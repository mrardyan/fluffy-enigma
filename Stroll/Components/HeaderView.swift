// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 10) {
                    Text("Your Turn")
                        .font(token: .custom(size: 22, weight: .bold))
                        .frame(height: 27)
                        .foreground(token: .primary)
                    
                    Circle()
                        .fill(Accent.secondary.color)
                        .frame(width: 16)
                        .overlay {
                            Text("7")
                                .font(token: .custom(size: 10, weight: .bold))
                                .foregroundColor(BackgroundColor.primary.color)
                        }
                }
                
                Text("Make your move, they are waiting 🎵")
                    .font(token: .custom(size: 12, weight: .regular))
                    .foreground(token: .secondary)
                    .italic()
                
            }
            
            Spacer()
            
            ProfileAvatarView()
        }
    }
}
