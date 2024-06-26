@testable import RefactorViewController
import XCTest

final class ItemViewControllerTests : XCTestCase {
    private var sut: ItemViewController!

    @MainActor
    override func setUp() {
        super.setUp()
        sut = ItemViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    @MainActor
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.titleLabel, "titleLabel")
        XCTAssertNotNil(sut.imageView, "imageView")
        XCTAssertNotNil(sut.currentPriceLabel, "currentPriceLabel")
        XCTAssertNotNil(sut.strikethroughPriceLabel, "strikethroughPriceLabel")
    }

    @MainActor
    func test_loadingView_shouldClearTheView() {
        XCTAssertNil(sut.titleLabel.text, "titleLabel text")
        XCTAssertNil(sut.imageView.image, "imageView image")
        XCTAssertNil(sut.currentPriceLabel.text, "currentPriceLabel text")
        XCTAssertNil(sut.strikethroughPriceLabel.text, "strikethroughPriceLabel text")
    }
    
    @MainActor
    func test_settingItem_shouldShowTitle() {
        sut.item = Item(title: "TITLE", image: UIImage(), currentPrice: 0, savingsRate: 0, listPrice: 0)

        XCTAssertEqual(sut.titleLabel.text, "TITLE")
    }

    @MainActor
    func test_settingItem_shouldShowImage() {
        let path = Bundle(for: type(of: self)).path(forResource: "blackPixel", ofType: "png")!
        let image = UIImage(contentsOfFile: path)!

        sut.item = Item(title: "", image: image, currentPrice: 0, savingsRate: 0, listPrice: 0)

        XCTAssertTrue(sut.imageView.image === image)
    }

    @MainActor
    func test_settingItem_shouldShowCurrentPriceLabelWithCurrency() {
        sut.item = Item(title: "", image: UIImage(), currentPrice: 123, savingsRate: 0, listPrice: 0)

        XCTAssertEqual(sut.currentPriceLabel.text, "€123")
    }

    @MainActor
    func test_settingItem_withSavings_shouldShowStrikethroughPriceAsListPriceWithCurrency() {
        sut.item = Item(title: "", image: UIImage(), currentPrice: 0, savingsRate: 1, listPrice: 123)

        XCTAssertEqual(sut.strikethroughPriceLabel.attributedText?.string, "€123")
    }

    @MainActor
    func test_settingItem_withSavings_shouldShowStrikethroughPriceWithStrikethroughAttribute() {
        sut.item = Item(title: "", image: UIImage(), currentPrice: 0, savingsRate: 1, listPrice: 123)

        let salePrice = sut.strikethroughPriceLabel.attributedText!
        XCTAssertNotNil(salePrice.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.strikethroughStyle])
    }

    @MainActor
    func test_settingItem_withSavings_shouldShowPreviouslyHiddenStrikethroughPrice() {
        sut.strikethroughPriceLabel.isHidden = true

        sut.item = Item(title: "", image: UIImage(), currentPrice: 0, savingsRate: 1, listPrice: 123)

        XCTAssertFalse(sut.strikethroughPriceLabel.isHidden)
    }

    @MainActor
    func test_settingItem_withNoSavings_shouldHidePreviouslyShowingStrikethroughPrice() {
        sut.strikethroughPriceLabel.isHidden = false

        sut.item = Item(title: "", image: UIImage(), currentPrice: 0, savingsRate: 0, listPrice: 123)

        XCTAssertTrue(sut.strikethroughPriceLabel.isHidden)
    }

    @MainActor
    func test_clearingItem_shouldClearTheView() {
        sut.item = Item(title: "", image: UIImage(), currentPrice: 0, savingsRate: 1, listPrice: 123)
        
        sut.item = nil

        XCTAssertNil(sut.titleLabel.text, "titleLabel text")
        XCTAssertNil(sut.imageView.image, "imageView image")
        XCTAssertNil(sut.currentPriceLabel.text, "currentPriceLabel text")
        XCTAssertNil(sut.strikethroughPriceLabel.text, "strikethroughPriceLabel text")
    }
}
