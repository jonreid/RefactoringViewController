import UIKit

final class SelectionViewController: UIViewController {
    var showRegularItem: () -> Void
    var showSaleItem: () -> Void

    init(showRegularItem: @escaping () -> Void, showSaleItem: @escaping () -> Void) {
        self.showRegularItem = showRegularItem
        self.showSaleItem = showSaleItem
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction private func showRegularItemTapped(sender: AnyObject) {
        showRegularItem()
    }

    @IBAction private func showSaleItemTapped(sender: AnyObject) {
        showSaleItem()
    }
}
