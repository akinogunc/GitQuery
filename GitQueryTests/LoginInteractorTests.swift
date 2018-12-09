//
//  LoginInteractorTests.swift
//  GitQueryTests
//
//  Created by Maruf Nebil Ogunc on 9.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import XCTest
@testable import GitQuery

class LoginInteractorTests: XCTestCase {
    var loginInteractor = LoginInteractor()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testSaveCredentials() {
        loginInteractor.saveCredentials(credentials: Credential(username: "akin", password: "12345"))
        
        let data = UserDefaults.standard.value(forKey: "credentials") as? Data
        let credentials = try! PropertyListDecoder().decode(Credential.self, from: data!)

        XCTAssertTrue(credentials.username == "akin")
        XCTAssertTrue(credentials.password == "12345")

    }

    func testGetCredentials() {
        loginInteractor.saveCredentials(credentials: Credential(username: "admin", password: "password"))

        let credentials = loginInteractor.getCredentials()
        
        XCTAssertTrue(credentials.username == "admin")
        XCTAssertTrue(credentials.password == "password")

    }

}
