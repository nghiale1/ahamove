//
//  ProgrammingLanguage.swift
//  ahamove
//
//  Created by Nghia on 24/09/2024.
//

import Foundation
import SwiftUI
enum LanguageColor: String {
    case javascript = "javascript"
    case python = "python"
    case java = "java"
    case cSharp = "csharp"
    case php = "php"
    case ruby = "ruby"
    case cpp = "cpp"
    case go = "go"
    case swift = "swift"
    case typescript = "typescript"

    var color: Color {
        switch self {
        case .javascript: return Color(hex: "#F1E05A") ?? .red
        case .python: return Color(hex: "#3572A5") ?? .red
        case .java: return Color(hex: "#B07219") ?? .red
        case .cSharp: return Color(hex: "#178600") ?? .red
        case .php: return Color(hex: "#4F5D95") ?? .red
        case .ruby: return Color(hex: "#701516") ?? .red
        case .cpp: return Color(hex: "#F34B7D") ?? .red
        case .go: return Color(hex: "#00ADD8") ?? .red
        case .swift: return Color(hex: "#FFAC45") ?? .red
        case .typescript: return Color(hex: "#2B7489") ?? .red
        }
    }

    init?(from string: String) {
        self.init(rawValue: string.lowercased())
    }
}

// Extension để chuyển đổi mã màu hex sang Color
extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
