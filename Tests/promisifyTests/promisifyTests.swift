import XCTest
@testable import promisify

final class promisifyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(promisify().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
