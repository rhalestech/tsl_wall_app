//
//  DataManagerTests.swift
//  tsl_wall_app
//
//  Created by Ruben Hales on 9/23/23.
//

import XCTest
@testable import tsl_wall_app
import FirebaseAuth
import Firebase
import FirebaseFirestore

final class DataManagerTests: XCTestCase {
    var dataManager: DataManager!
    var auth: Auth!

    override func setUpWithError() throws {
        super.setUp()
        FirebaseApp.configure() // configure Firebase
        dataManager = DataManager()
        auth = Auth.auth()
    }
    override func tearDownWithError() throws {
        dataManager = nil
        try? auth.signOut()
        super.tearDown()
    }

    func testUserRegistration() throws {
        let expectation = self.expectation(description: "User registration")
        
        auth.createUser(withEmail: "test@test.com", password: "testPass") { result, error in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUserLogin() throws {
        let expectation = self.expectation(description: "User login")
        
        auth.signIn(withEmail: "test@test.com", password: "testPass") { result, error in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchPosts() throws {
        dataManager.fetchPosts()
        XCTAssertNotNil(dataManager.posts)
    }

    func testAddPost() throws {
        dataManager.addPost(postBreed: "TestBreed")
        
        // Ideally, after adding a post, you'd fetch all posts and check if the new post exists.
        dataManager.fetchPosts()
        
        // Note: This check may not be accurate if the fetchPosts and addPost actions are asynchronous.
        // It's better to use expectations and observe the posts array for changes.
        XCTAssertTrue(dataManager.posts.contains { $0.breed == "TestBreed" })
    }
}

