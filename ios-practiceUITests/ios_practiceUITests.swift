import XCTest
import ios_practice
@testable import ios_practice


class ios_practiceUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launchArguments = ["-isTesting"]
        continueAfterFailure = false
        app.launch()
    }
    
    func testScneario_CreateDoDItemAndShow() throws {
        TabBar(app: app)
            .tapButton(label: "create")
        DoDCreatePage(app: app)
            .fillInText(id: "DoD", text: "Coverage")
            .tapButton(label: "Create DoD")
            .tapButton(label: "OK")
        TabBar(app: app)
            .tapButton(label: "list")
        DoDListPage(app: app)
            .pageHasText(label: "Coverage")
    }
    
    class TabBar: Page<TabBar> { }
    class DoDListPage: Page<DoDListPage> { }
    class DoDCreatePage: Page<DoDCreatePage> { }
    class Page<T> {
        let app:XCUIApplication
        init(app:XCUIApplication) {
            self.app = app
        }
        @discardableResult
        func tapButton(label:String) -> T {
            self.app.buttons[label].tap()
            return self as! T
        }
        @discardableResult
        func fillInText(id:String, text:String) -> T {
            self.app.textFields.firstMatch.tap()
            self.app.textFields.firstMatch.typeText(text)
            return self as! T
        }
        @discardableResult
        func pageHasText(label:String) -> T {
            XCTAssertEqual(true, self.app.staticTexts[label].exists)
            return self as! T
        }
    }
}

//        app.buttons["Coverage"].tap()
//        app.buttons["openDoDRecordFormModal"].tap()
//        app.textFields.firstMatch.tap()
//        app.textFields.firstMatch.typeText("Coverage")
