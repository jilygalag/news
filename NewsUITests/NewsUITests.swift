//
//  NewsUITests.swift
//  NewsUITests
//
//  Created by Juliana Galag on 12/7/24.
//

import XCTest

final class NewsUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // This method is called before each test is run
        continueAfterFailure = false // Fail fast on UI test failures
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // This method is called after each test completes
        app = nil
    }
    

    func testNewsListScreenLoadsCorrectly() {
        let newsTitle = app.staticTexts["News"]
        XCTAssertTrue(newsTitle.exists, "The News List screen title should be visible")
    }
    

    func testTapOnNewsItemNavigatesToDetailScreen() {
        // Tap the first cell in the list
        let firstNewsCell = app.tables.cells.element(boundBy: 0) // First cell in the table
        XCTAssertTrue(firstNewsCell.exists, "The first news item should exist")
        
        firstNewsCell.tap()
        
        let titleLabel = app.staticTexts.element(boundBy: 0)
        XCTAssertTrue(titleLabel.exists, "News Detail should have a title")
    }
    

    func testScrollNewsList() {
        let tableView = app.tables.element(boundBy: 0)
        
        XCTAssertTrue(tableView.exists, "The news list (table view) should exist")
        tableView.swipeUp()
        tableView.swipeDown()
    }
    

    func testAllNewsItemsHaveTitles() {
        let tableView = app.tables.element(boundBy: 0)
        XCTAssertTrue(tableView.exists, "The news list (table view) should exist")
        
        let cells = tableView.cells
        for i in 0..<min(5, cells.count) { // Check first 5 cells only
            let titleLabel = cells.element(boundBy: i).staticTexts.element(boundBy: 0)
            XCTAssertTrue(titleLabel.exists, "News item \(i) should have a title")
        }
    }
    
}
