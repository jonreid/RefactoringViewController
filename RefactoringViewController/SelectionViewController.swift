import UIKit

final class SelectionViewController: UIViewController {
    private var showRegularItem: () -> Void
    private var showSaleItem: () -> Void
    private var showNoItem: () -> Void

    init(showRegularItem: @escaping () -> Void, showSaleItem: @escaping () -> Void, showNoItem: @escaping () -> Void) {
        self.showRegularItem = showRegularItem
        self.showSaleItem = showSaleItem
        self.showNoItem = showNoItem
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

    @IBAction private func showNoTapped(sender: AnyObject) {
        showNoItem()
    }
}
