// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct ChatTabMenuView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Chats")
                        .font(token: .custom(size: 22, weight: .bold))
                        .foreground(token: .primary)
                        .background {
                            VStack {
                                Spacer()
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .frame(maxWidth: .infinity)
                                    .foreground(token: .primary)
                            }
                            .frame(height: 27)
                        }
                    
                    Text("Pending")
                        .font(token: .custom(size: 22, weight: .bold))
                        .foreground(token: .muted)
                }
                
                Text("The ice is broken. Time to hit it off")
                    .font(token: .custom(size: 12, weight: .regular))
                    .foreground(token: .secondary)
                    .italic()
            }
            
            Spacer()
        }
    }
}
