//
//  GHFollowersUITests.swift
//  GHFollowersUITests
//
//  Created by Kirill Gusev on 28.01.2024.
//

import XCTest
@testable import GHFollowers

final class GHFollowersUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testImageExists() {
        let image = app.images["logo"]
        XCTAssertTrue(image.exists)
    }
    
    func testExample() throws {
        let image = app.images["logo"]
        XCTAssertTrue(image.exists)
        
        let textField = app.textFields["Enter a username"]
        XCTAssertTrue(textField.exists)
        let button = app.buttons["Get Followers"]
        XCTAssertTrue(button.exists)
        
        guard textField.exists && button.exists else { return XCTFail()}
        
        textField.tap()
        textField.typeText("myaumura")
        image.tap()
        button.tap()
        
        let username = app.staticTexts["myaumura"]
        XCTAssertTrue(username.exists)
    }
    
    func testTabBarButtons() {
        let searchButton = app.buttons["Search"]
        let favoritesButton = app.buttons["Favorites"]
        
        XCTAssertTrue(searchButton.exists)
        XCTAssertTrue(favoritesButton.exists)
    }

    func testEmptyTextfield() {
        let getFollowersButton = app.buttons["Get Followers"]
        XCTAssertTrue(getFollowersButton.exists)
        
        getFollowersButton.tap()
        
        let staticText = app.staticTexts["Empty username"]
        XCTAssertTrue(staticText.exists)
        
        let okButton = app.buttons["Ok"]
        XCTAssertTrue(okButton.exists)
        okButton.tap()
    }
}
