//
//  FollowersPage.swift
//  GHFollowersUITests
//
//  Created by k.gusev on 16.05.2024.
//

import XCTest

final class FollowersPage: XCTestCase {
    
    private let rootView = XCUIApplication().descendants(matching: .any).matching(identifier: Constants.pageId).element
    private let textField = XCUIApplication().descendants(matching: .textField).matching(identifier: Constants.textFieldId).element
    private let tabBar = XCUIApplication().descendants(matching: .any).matching(identifier: Constants.tabbarID).element
    private let collectionView = XCUIApplication().collectionViews[Constants.collectionViewId]
    private let cell = XCUIApplication().cells[Constants.cellID]
    
    enum Constants {
        static var pageId = "FOLLOWER_LIST_VIEW"
        static var textFieldId = "GF_TEXT_FIELD"
        static var collectionViewId = "FOLLOWER_COLLECTION_VIEW"
        static var cellID = "FOLLOWER_CELL"
        static var tabbarID = "TAB_BAR"
    }
    
    @discardableResult
    func checkPage() -> Self {
        _ = rootView.waitForExistence(timeout: 10)
        return self
    }
    
    @discardableResult
    func checkCollectionView() -> Self {
        _ = collectionView.waitForExistence(timeout: 5)
        XCTAssertTrue(collectionView.exists)
        return self
    }
    
    @discardableResult
    func checkCell() -> Self {
        _ = cell.waitForExistence(timeout: 5)
        XCTAssertTrue(cell.exists)
        return self
    }
    
    @discardableResult
    func typeTextField(text: String) -> Self {
        _ = textField.waitForExistence(timeout: 5)
        XCTAssertTrue(textField.exists, "Поле ввода текста существует")
        textField.tap()
        textField.typeText(text)
        return self
    }
    
    @discardableResult
    func checkTabBar() -> Self {
        _ = tabBar.waitForExistence(timeout: 5)
        XCTAssertTrue(tabBar.exists, "Таббар существует")
        return self
    }
    
}
