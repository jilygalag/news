//
//  NewsUITestsLaunchTests.swift
//  NewsUITests
//
//  Created by Juliana Galag on 12/7/24.
//

import XCTest

final class NewsUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLaunchPerformance() {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            let app = XCUIApplication()
            app.launch()
        }
    }
}
