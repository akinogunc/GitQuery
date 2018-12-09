//
//  LoginNetworkManagerTests.swift
//  GitQueryTests
//
//  Created by Maruf Nebil Ogunc on 9.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import XCTest
@testable import GitQuery

class LoginNetworkManagerTests: XCTestCase {

    var networkManager = LoginNetworkManager()

    override func setUp() {
    }

    override func tearDown() {
    }

/*    func testLoginSuccess() {

        let expectation = self.expectation(description: "1")
        var myRepos = NSArray()
        
        networkManager.loginAndGetRepositories(credentials: Credential(username: "", password: ""), completion: {connectionResult in
            
            switch connectionResult {
            case .failure(let error): print(error)
            case .success(let response):
                
                myRepos = response
                expectation.fulfill()

            }
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertTrue(myRepos.count == 6)
        
        let dict = myRepos[0] as! NSDictionary
        
        XCTAssertTrue((dict["name"] as! String) == "Fitness-Tracker")
        XCTAssertTrue((dict["description"] as? NSNull) == NSNull())

    }*/

    func testLoginFail() {
        
        let expectation = self.expectation(description: "2")
        var errorString = String()
        
        networkManager.loginAndGetRepositories(credentials: Credential(username: "akin", password: "12345"), completion: {connectionResult in
            
            switch connectionResult {
            case .failure(let error):
                
                errorString = error
                expectation.fulfill()
                
            case .success(let response):
                print(response)
            }
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertTrue(errorString == "Bad credentials")
        
    }

}
