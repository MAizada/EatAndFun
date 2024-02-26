

import UIKit

struct ColorExtension {
    static let darkRed = UIColor(hex: 0xBE0127)
    static let lightRed = UIColor(hex: 0xF13A21)
    static let lightYellow = UIColor(hex: 0xF8E0A0)
}

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
