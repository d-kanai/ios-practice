import XCTest

class ios_practiceUITests: XCTestCase {

    var app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testCreateDoD() throws {
        app = XCUIApplication()
        app.launch()
        app.buttons["create"].tap()
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText("Coverage")
        app.buttons["Create DoD"].tap()
        app.buttons["OK"].tap()
        app.buttons["list"].tap()
        XCTAssertEqual(true, app.staticTexts["Coverage"].exists)
    }

}
