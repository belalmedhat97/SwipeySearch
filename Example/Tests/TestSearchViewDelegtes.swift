import XCTest
@testable import SwipeySearch

class TestSearchViewDelegtes: XCTestCase {
    
    var searchView:SwipeySearchView?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // given
        searchView = SwipeySearchView()
        searchView?.delegate = self



    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        searchView = nil
    }
    func testDidAddTextSeachField(){
        
        // when
        searchView?.SearchField.text = "abc"
        searchView?.delegate?.handleDidChangeText(textValue: "abc")

        searchView?.SearchField.text = "abcd"
        searchView?.delegate?.handleDidChangeText(textValue: "abcd")

        searchView?.SearchField.text = "abcde"
        searchView?.delegate?.handleDidChangeText(textValue: "abcde")
        
        

    }
    func testDidSearchButtonPressed(){
        // when
        searchView?.SearchField.text = "abc"
        searchView?.delegate?.handleDidPressSearch(textValue: searchView?.SearchField.text ?? "")
    }
    
}
extension TestSearchViewDelegtes:SwipeySearchProtocol {
    func handleDidPressSearch(textValue: String) {
        // then
        XCTAssertEqual(textValue, searchView?.SearchField.text)
    }
    
    func handleDidChangeText(textValue: String) {
        // then
        XCTAssertEqual(textValue, searchView?.SearchField.text)
    }
}
