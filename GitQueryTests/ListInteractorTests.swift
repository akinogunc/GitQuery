//
//  GitQueryTests.swift
//  GitQueryTests
//
//  Created by Maruf Nebil Ogunc on 6.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import XCTest
@testable import GitQuery

class ListInteractorTests: XCTestCase {
    var listInteractor = ListInteractor()
    
    override func setUp() {
    }

    override func tearDown() {
    }

    func testFromJsonToRepositoryItems() {
        
        var repositoryItems = [RepositoryItem]()
        let expectation = self.expectation(description: "1")

        listInteractor.networkManager.networkRequestWithQuery(query: "fitness", type: .firstQuery, completion: {connectionResult in
            
            switch connectionResult {
            case .failure(let error): print(error)
            case .success(let response):
                
                repositoryItems = self.listInteractor.fromJsonToRepositoryItems(jsonArray: response)
                expectation.fulfill()

            }
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertEqual(repositoryItems[0].repositoryName, "fitnesse")
        XCTAssertEqual(repositoryItems[0].avatarUrl, "https://avatars3.githubusercontent.com/u/36901?v=4")
        XCTAssertEqual(repositoryItems[0].stars.stringValue, "1244")
        XCTAssertEqual(repositoryItems[0].watchers.stringValue, "1244")
        XCTAssertEqual(repositoryItems[0].forks.stringValue, "570")
        XCTAssertEqual(repositoryItems[0].forksUrl, "https://api.github.com/repos/unclebob/fitnesse/forks")
        XCTAssertEqual(repositoryItems[0].description, "FitNesse -- The Acceptance Test Wiki")

    }

    func testFromJsonToRepositoryItemsEmptyDescription() {
        
        var repositoryItems = [RepositoryItem]()
        let expectation = self.expectation(description: "2")

        listInteractor.networkManager.networkRequestWithQuery(query: "fitness-gulp", type: .firstQuery, completion: {connectionResult in
            
            switch connectionResult {
            case .failure(let error): print(error)
            case .success(let response):
                
                repositoryItems = self.listInteractor.fromJsonToRepositoryItems(jsonArray: response)
                expectation.fulfill()

            }
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(repositoryItems[0].description, "No Description")

    }


}
