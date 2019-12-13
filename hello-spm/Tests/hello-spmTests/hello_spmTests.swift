import XCTest
@testable import hello_spm

final class hello_spmTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(hello_spm().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
