import UIKit

extension UILabel {
    func setStrikethroughText(_ text: String) {
        self.attributedText = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
    }
}
