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
        let textField = app.textFields.matching(.textField, identifier: "Username Text Field")
        let button = app.buttons.matching(.button, identifier: "Action Button")
        let username = app.staticTexts["myaumura"]
        
        guard textField.element.exists && button.element.exists else { return XCTFail()}
        
        textField.element.tap()
        textField.element.typeText("myaumura")
        image.tap()
        button.element.tap()
        
        XCTAssertTrue(image.exists)
        XCTAssertTrue(textField.element.exists)
        XCTAssertTrue(button.element.exists)
        XCTAssertTrue(username.exists)
    }
    
    func testTabBarButtons() {
        let searchButton = app.buttons.matching(.button, identifier: "Search")
        let favoritesButton = app.buttons.matching(.button, identifier: "Favorites")
        
        XCTAssertTrue(searchButton.element.exists)
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
        let followerCollectionView = app.collectionViews["Followers Collection View"]
        let cell = followerCollectionView.cells.element(boundBy: 0)
       
        guard textField.element.exists && button.element.exists else { return XCTFail()}
        textField.element.tap()
        textField.element.typeText("antigluten")
        image.tap()
        button.element.tap()
            
        XCTAssertFalse(cell.exists)
    }
    
    func testGetFullCollectionView() {
        
    }
    
    func testEmptyTextfield() {
        let getFollowersButton = app.buttons.matching(.button, identifier: "Action Button")
        let staticText = app.staticTexts["Empty username"]
        let okButton = app.buttons["Ok"]
        
        getFollowersButton.element.tap()
        okButton.tap()
        
        XCTAssertTrue(getFollowersButton.element.exists)
        XCTAssertTrue(staticText.exists)
        XCTAssertTrue(okButton.exists)
    }
    
    func testUI() {
        
    }
}
