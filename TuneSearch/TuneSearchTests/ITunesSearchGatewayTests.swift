import XCTest
@testable import TuneSearch

class ITunesSearchGatewayTests : XCTestCase {
    
    func testFetch() {
        let expectation = self.expectation(description: "Async complete")
        let gateway = ITunesSearchGateway()
        gateway.fetchData(searchTerm: "Jack", completion:
            {
                switch $0 {
                case let .success(response):
                    XCTAssert(response.count>0)
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                }
                expectation.fulfill()
        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
