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
        app.terminate()
        app = nil
    }
    
    func testImageExists() {
        let image = app.images["logoImage"]
        XCTAssertTrue(image.exists)
    }
    
    func testExample() throws {
        let image = app.images["logoImage"]
        XCTAssertTrue(image.exists)
        let textField = app.textFields.matching(.textField, identifier: "Username Text Field")
        XCTAssertTrue(textField.element.exists)
        let button = app.buttons.matching(.button, identifier: "Action Button")
        XCTAssertTrue(button.element.exists)
        
        guard textField.element.exists && button.element.exists else { return XCTFail() }
        
        textField.element.tap()
        textField.element.typeText("myaumura")
        image.tap()
        button.element.tap()
        let username = app.staticTexts["myaumura"]
        XCTAssertTrue(username.exists)
    }
    
    func testTabBarButtons() {
        let searchButton = app.buttons.matching(.button, identifier: "Search")
        XCTAssertTrue(searchButton.element.exists)
        let favoritesButton = app.buttons.matching(.button, identifier: "Favorites")
        XCTAssertTrue(favoritesButton.element.exists)
    }
    
    func testFavoritesBarButton() {
        let favoritesButton = app.buttons.matching(.button, identifier: "Favorites")
        let favoriteText = app.staticTexts.matching(.staticText, identifier: "Favorites")
        
        favoritesButton.element.tap()
        XCTAssertTrue(favoritesButton.element.exists)
        XCTAssertTrue(favoriteText.element.exists)
    }
    
    func testFollowersCollectionView() {
        let image = app.images["logoImage"]
        let textField = app.textFields.matching(.textField, identifier: "Username Text Field")
        let button = app.buttons.matching(.button, identifier: "Action Button")
        let followerCollectionView = app.collectionViews["Followers Collection View"]
        let cell = followerCollectionView.cells.element(boundBy: 0)
       
        guard textField.element.exists && button.element.exists else { return XCTFail()}
        textField.element.tap()
        textField.element.typeText("myaumura")
        image.tap()
        button.element.tap()
        
        XCTAssertTrue(cell.exists)
    }
    
    func testEmptyFollowersCollectionView() {
        let image = app.images["logoImage"]
        let textField = app.textFields.matching(.textField, identifier: "Username Text Field")
        let button = app.buttons.matching(.button, identifier: "Action Button")
       
        guard textField.element.exists && button.element.exists else { return XCTFail() }
        textField.element.tap()
        textField.element.typeText("antigluten")
        image.tap()
        button.element.tap()
        let followerCollectionView = app.collectionViews["Followers Collection View"]
        XCTAssertTrue(followerCollectionView.exists)
        let cell = followerCollectionView.cells.element(boundBy: 0)
        XCTAssertTrue(cell.exists)
    }
    
    func testGetFullCollectionView() {
        let collectionView = app.collectionViews["GHCollectionView"]
        XCTAssertTrue(collectionView.exists)
    }
    
    func testEmptyTextfield() {
        let getFollowersButton = app.buttons.matching(.button, identifier: "Action Button")
        XCTAssertTrue(getFollowersButton.element.exists)
        getFollowersButton.element.tap()
        let staticText = app.staticTexts["Empty username"]
        XCTAssertTrue(staticText.exists)
        let okButton = app.buttons["Ok"]
        XCTAssertTrue(okButton.exists)
        okButton.tap()
    }
}
