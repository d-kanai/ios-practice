import XCTest

class ios_practiceUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testShowDoD() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Long Method"].tap()
        XCTAssertEqual(true, app.staticTexts["Long Method"].exists)
    }
}
