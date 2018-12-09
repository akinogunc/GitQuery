//
//  ListNetworkManager.swift
//  GitQueryTests
//
//  Created by Maruf Nebil Ogunc on 9.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import XCTest
@testable import GitQuery

class ListNetworkManagerTests: XCTestCase {

    var networkManager = ListNetworkManager()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testNetworkRequest() {

        let expectation = self.expectation(description: "1")
        var expectedResponse = NSArray()
        
        networkManager.networkRequestWithQuery(query: "ios", type: .firstQuery, completion: {connectionResult in
            
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
        
        XCTAssertTrue((dict["name"] as! String) == "ios")
        XCTAssertTrue((owner["avatar_url"] as! String) == "https://avatars3.githubusercontent.com/u/1645051?v=4")
        XCTAssertTrue((dict["description"] as! String) == ":iphone: iOS app for ownCloud")
        XCTAssertTrue((dict["forks"] as! NSNumber) == 731)
        XCTAssertTrue((dict["forks_url"] as! String) == "https://api.github.com/repos/owncloud/ios/forks")
        XCTAssertTrue((dict["watchers"] as! NSNumber) == 595)
        XCTAssertTrue((dict["stargazers_count"] as! NSNumber) == 595)

    }

    func testNetworkRequestSecondPage() {
        
        let expectation = self.expectation(description: "2")
        var expectedResponse = NSArray()
        
        networkManager.networkRequestWithQuery(query: "fitness tracker", type: .loadMore, completion: {connectionResult in
            
            switch connectionResult {
            case .failure(let error): print(error)
            case .success(let response):
                
                expectedResponse = response
                expectation.fulfill()
            }
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        
        let dict = expectedResponse[0] as! NSDictionary
        
        XCTAssertTrue((dict["name"] as! String) == "ninety-days")
        
    }

}
