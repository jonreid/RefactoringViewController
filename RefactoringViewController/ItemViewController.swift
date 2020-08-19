import UIKit

final class ItemViewController: UIViewController {
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var imageView: UIImageView!
    @IBOutlet private(set) var currentPriceLabel: UILabel!
    @IBOutlet private(set) var strikethroughPriceLabel: UILabel!

    var item: Item? {
        didSet {
            if let item = item {
                titleLabel.text = item.title
                imageView.image = item.image
                currentPriceLabel.text = "€\(item.currentPrice)"
                if item.savingsRate > 0 {
                    strikethroughPriceLabel.setStrikethroughText("€\(item.listPrice)")
                    strikethroughPriceLabel.isHidden = false
                } else {
                    strikethroughPriceLabel.isHidden = true
                }
            } else {
                titleLabel.text = nil
                imageView.image = nil
                currentPriceLabel.text = nil
                strikethroughPriceLabel.attributedText = nil
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        item = nil
    }
}
