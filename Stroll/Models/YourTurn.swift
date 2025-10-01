// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct YourTurn: Identifiable {
    let id = UUID()
    let avatar: Image
    let name: String
    let age: Int
    let message: String
    let isTheirMove: Bool
}
