import XCTest
import ios_practice
@testable import ios_practice


class ios_practiceUITests: XCTestCase {
    
    var app = XCUIApplication()
    override func setUpWithError() throws {
        app.launchArguments = ["-isTesting"]
        continueAfterFailure = false
    }
    
    func testCreateDoD() throws {
        app.launch()
        //dod create
        app.buttons["create"].tap()
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText("Coverage")
        app.buttons["Create DoD"].tap()
        app.buttons["OK"].tap()
        //detail
        app.buttons["list"].tap()
        XCTAssertEqual(true, app.staticTexts["Coverage"].exists)
        app.buttons["Coverage"].tap()
        //dod record modal
        app.buttons["openDoDRecordFormModal"].tap()
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText("Coverage")
    }
    
}
