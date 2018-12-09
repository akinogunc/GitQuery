//
//  DetailInteractorTests.swift
//  GitQueryTests
//
//  Created by Maruf Nebil Ogunc on 9.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import XCTest
@testable import GitQuery

class DetailInteractorTests: XCTestCase {
    var detailInteractor = DetailInteractor()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testfromJsonToForkOwners() {

        var forkOwners = [ForkOwner]()
        let expectation = self.expectation(description: "1")
        
        detailInteractor.networkManager.networkRequestWithUrl(url: "https://api.github.com/repos/unclebob/fitnesse/forks", type: .firstQuery, completion: {connectionResult in
            
            switch connectionResult {
            case .failure(let error): print(error)
            case .success(let response):
                
                forkOwners = self.detailInteractor.fromJsonToForkOwners(jsonArray: response)
                expectation.fulfill()

            }
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertEqual(forkOwners[0].loginName, "murughan1985")
        XCTAssertEqual(forkOwners[0].avatarUrl, "https://avatars0.githubusercontent.com/u/8857746?v=4")
    }


}
