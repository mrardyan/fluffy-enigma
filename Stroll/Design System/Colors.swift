// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

enum ForegroundColor {
    case primary
    case secondary
    case muted
    case accent(Accent)
    case custom(hex: String)
    
    var color: Color {
        switch self {
        case .primary: return Color(hex: "#F5F5F5")
        case .secondary: return Color(hex: "#A8AFB7")
        case .muted: return Color(hex: "#5F5F60")
        case .accent(let accent): return accent.color
        case .custom(let hex): return Color(hex: hex)
            
        }
    }
}

enum BackgroundColor {
    case primary
    case secondary
    case accent(Accent)
    case custom(hex: String)
    
    var color: Color {
        switch self {
        case .primary: return Color(hex: "#0B0D0E")
        case .secondary: return Color(hex: "#0F1115")
        case .accent(let accent): return accent.color
        case .custom(let hex): return Color(hex: hex)
        }
    }
}

enum Accent {
    case primary
    case secondary
    
    var color: Color {
        switch self {
        case .primary: Color(hex: "#B5B2FF")
        case .secondary: Color(hex: "#B49AD1")
        }
    }
}

extension View {
    func foreground(token: ForegroundColor, opacity: Double = 1) -> some View {
        foregroundColor(token.color)
    }
    
    func background(token: BackgroundColor, opacity: Double = 1) -> some View {
        background(token.color.opacity(opacity))
    }
}
