//
//  NewsTests.swift
//  NewsTests
//
//  Created by Juliana Galag on 12/7/24.
//

import Testing
import XCTest
@testable import News // Replace with the actual name of your project

class NewsTests: XCTestCase {
    
    func testNewsInitialization() {
        let title = "Breaking News"
        let image = "https://example.com/image.jpg"
        let content = "This is a sample news content."
        let publishedAt = "2024-12-07T12:34:56Z"
        
        let news = News(title: title, image: image, content: content, publishedAt: publishedAt)
        
        XCTAssertEqual(news.title, title, "Title should be set correctly")
        XCTAssertEqual(news.image, image, "Image URL should be set correctly")
        XCTAssertEqual(news.content, content, "Content should be set correctly")
        XCTAssertEqual(news.publishedAt, publishedAt, "PublishedAt date should be set correctly")
    }
    
    func testNewsDecodingFromJSON() {
        let json = """
        {
            "title": "Breaking News",
            "image": "https://example.com/image.jpg",
            "content": "This is a sample news content.",
            "publishedAt": "2024-12-07T12:34:56Z"
        }
        """.data(using: .utf8)!
        
        // When
        let decoder = JSONDecoder()
        do {
            let news = try decoder.decode(News.self, from: json)
            
            // Then
            XCTAssertEqual(news.title, "Breaking News", "Title should be correctly decoded")
            XCTAssertEqual(news.image, "https://example.com/image.jpg", "Image URL should be correctly decoded")
            XCTAssertEqual(news.content, "This is a sample news content.", "Content should be correctly decoded")
            XCTAssertEqual(news.publishedAt, "2024-12-07T12:34:56Z", "PublishedAt date should be correctly decoded")
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
}
