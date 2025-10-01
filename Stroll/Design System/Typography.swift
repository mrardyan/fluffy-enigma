// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

fileprivate let fontBold = "FONTSPRINGDEMO-ProximaNovaBold"
fileprivate let fontSemibold = "FONTSPRINGDEMO-ProximaNovaSemiboldRegular"
fileprivate let fontRegular = "FONTSPRINGDEMO-ProximaNovaRegular"

enum Typography {
    case custom(size: CGFloat, weight: Font.Weight?)
    
    fileprivate var font: Font {
        switch self {
        case .custom(let size, let weight):
            switch weight {
            case .bold:
                return .custom(fontBold, size: size)
            case .semibold:
                return .custom(fontSemibold, size: size)
            default:
                return .custom(fontRegular, size: size)
            }
        }
    }
}

extension Text {
    func font(token: Typography) -> Text {
        self.font(token.font)
    }
}
