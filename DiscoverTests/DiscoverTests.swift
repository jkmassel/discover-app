import XCTest
@testable import Discover

class DiscoverTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatHashStringProducesValidSHA256Hash() {
        XCTAssertEqual(64, "Test String".sha256.count)
    }
}
