//
//  BreakingBadSwiftUICombineTests.swift
//  BreakingBadSwiftUICombineTests
//
//  Created by Павел Черняев on 30.11.2021.
//

import XCTest
@testable import BreakingBadSwiftUICombine

class BreakingBadSwiftUICombineTests: XCTestCase {

    var apiService: APIService!
    
    override func setUpWithError() throws {
        apiService = APIService()
    }

    override func tearDownWithError() throws {
        apiService = nil
    }
    
    func testNumbersMyFirstTest() {
        let a = 1
//        let b = 2
        let b = 1
        XCTAssert( a == b , "Error \(a) not equals \(b)")
    }
    
    func test_URLCharacters() {
        //Given
        let result = URL(string: "https://www.breakingbadapi.com/api/characters")!
        var expectation: URL
        
        //When
        expectation = APIService.Method.characters.url
        
        //Then
        XCTAssertEqual(expectation, result, "Expected url: \(expectation); Result url: \(result)")
    }
    
    func test_URLEpisodes() {
        //Given
        let result = URL(string: "https://www.breakingbadapi.com/api/episodes")!
        var expectation: URL
        
        //When
        expectation = APIService.Method.episodes.url
        
        //Then
        XCTAssertEqual(expectation, result, "Expected url: \(expectation); Result url: \(result)")
    }

}
