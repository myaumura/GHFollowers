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
    
    private let page = SearchPage()
    private let username = "myaumura"
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app.terminate()
        app = nil
    }
    
    func testExample() throws {
        page.checkPage()
        page.typeTextField(text: username)
            .tapLogo()
            .tapButton()
    }
    
    func testImageExists() {
        page.checkPage()
            .tapLogo()
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
        page.getFollowers(text: username)
            .checkPage()
            .checkCollectionView()
            .checkCell()
    }
    
    func testEmptyAlert() {
        page.typeTextField(text: "")
            .tapLogo()
            .tapButton()
            .checkAlertName(text: "Empty username")
            .checkAlertBody(text: "Please enter the username. We need to know who to look for 😀.")
            .tapAlertButton()
            .checkPage()
    }
}
