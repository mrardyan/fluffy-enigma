// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct ChatDisplay: Identifiable {
    let id = UUID()
    let avatar: Image
    let name: String
    let lastMessage: Message
    let status: Status?
    let isFavorite: Bool
    let unreadCount: Int?
    
    enum Status {
        case new
        case yourMove
    }
    
    struct Message {
        let content: String
        let time: String
    }
}
