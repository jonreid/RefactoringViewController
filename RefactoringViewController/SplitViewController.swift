import UIKit

private func image(name: String) -> UIImage {
    let path = Bundle.main.path(forResource: name, ofType: "jpg")!
    return UIImage(contentsOfFile: path)!
}

final class SplitViewController: UISplitViewController {
    private let regularItem = Item(
            title: "Corn Flake Shaped like State of Illinois",
            image: image(name: "illinois-corn-flake"),
            currentPrice: 1350,
            savingsRate: 0,
            listPrice: 0
            )
    private let saleItem = Item(
            title: "Dorito Shaped like Pope’s Hat",
            image: image(name: "pope-dorito"),
            currentPrice: 1209,
            savingsRate: 20,
            listPrice: 1451
            )

    init() {
        super.init(nibName: nil, bundle: nil)
        let itemVC = ItemViewController()
        let mainVC = SelectionViewController(
                showRegularItem: { [weak self] in itemVC.item = self?.regularItem },
                showSaleItem: { [weak self] in itemVC.item = self?.saleItem },
                showNoItem: { itemVC.item = nil }
        )
        viewControllers = [mainVC, itemVC]
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
