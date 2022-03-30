
import XCTest
import ViewInspector
import SwiftUI

@testable import ios_practice

extension DoDApp: Inspectable { }
extension DoDDetail: Inspectable { }

class DoDTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    func test_showDoDDetailText() throws {
        //given
        let view = DoDDetail(dod: DoD.init(id: 1, name: "Long Method"))
        //when
        let text = try view.inspect().text(0).string()
        //then
        XCTAssertEqual(text, "Long Method")
    }
    func test_xxx() throws {
        //given
        let dodRepository:DoDRepository = FakeDoDRepository()
        var view = DoDApp().environmentObject(dodRepository)
        //when
//        try view.inspect().find(button: "Fake Long Method").tap()
        // XCTAssertEqual(text, "Long Method")
    }
    func test_example() throws {
        let view = MyView()
        let text = try view.inspect().find(text: "OK").string()
        XCTAssertEqual(text, "OK")
    }
    
}

extension DoDList: Inspectable { }
extension MyView: Inspectable { }
extension OtherView: Inspectable { }

struct MyView: View {
    var body: some View {
        HStack {
            Text("Hi")
            AnyView(OtherView())
        }
    }
}

struct OtherView: View {
    var body: some View {
        Text("OK").id("okText")
    }
}
