//
//  DetailNetworkManager.swift
//  GitQueryTests
//
//  Created by Maruf Nebil Ogunc on 9.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import XCTest
@testable import GitQuery

class DetailNetworkManagerTests: XCTestCase {

    var networkManager = DetailNetworkManager()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testNetworkRequest() {

        let expectation = self.expectation(description: "1")
        var expectedResponse = NSArray()
        
        networkManager.networkRequestWithUrl(url: "https://api.github.com/repos/unclebob/fitnesse/forks", type: .firstQuery, completion: {connectionResult in
            
            switch connectionResult {
            case .failure(let error): print(error)
            case .success(let response):
                
                expectedResponse = response
                expectation.fulfill()
                
            }
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertTrue(expectedResponse.count == 50)
        
        let dict = expectedResponse[0] as! NSDictionary
        let owner = dict["owner"] as! NSDictionary

        XCTAssertTrue((owner["login"] as! String) == "murughan1985")
        XCTAssertTrue((owner["avatar_url"] as! String) == "https://avatars0.githubusercontent.com/u/8857746?v=4")
        
    }

    func testNetworkRequestSecondPage() {
        
        let expectation = self.expectation(description: "2")
        var expectedResponse = NSArray()

        networkManager.networkRequestWithUrl(url: "https://api.github.com/repos/unclebob/fitnesse/forks", type: .firstQuery, completion: {connectionResult in})

        networkManager.networkRequestWithUrl(url: "", type: .loadMore, completion: {connectionResult in
            
            switch connectionResult {
            case .failure(let error): print(error)
            case .success(let response):
                
                expectedResponse = response
                expectation.fulfill()
                
            }
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertTrue(expectedResponse.count == 50)
        
        let dict = expectedResponse[0] as! NSDictionary
        let owner = dict["owner"] as! NSDictionary
        
        XCTAssertTrue((owner["login"] as! String) == "gauravsri")
        XCTAssertTrue((owner["avatar_url"] as! String) == "https://avatars3.githubusercontent.com/u/333272?v=4")
        
    }

}
