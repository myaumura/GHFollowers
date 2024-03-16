//
//  SearchPage.swift
//  GHFollowersUITests
//
//  Created by k.gusev on 15.05.2024.
//

import XCTest
@testable import GHFollowers

final class SearchPage: XCTestCase {
    
    private let rootView = XCUIApplication().descendants(matching: .any).matching(identifier: Constants.pageId).element
    private let button = XCUIApplication().descendants(matching: .button).matching(identifier: Constants.buttonId).element
    private let textField = XCUIApplication().descendants(matching: .textField).matching(identifier: Constants.textFieldId).element
    private let tabBar = XCUIApplication().descendants(matching: .any).matching(identifier: Constants.tabbarId).element
    private let logo = XCUIApplication().images[Constants.logoId]
    private let alert = XCUIApplication().descendants(matching: .any).matching(identifier: Constants.alertId).element
    private let alertButton = XCUIApplication().buttons[Constants.alertButtonId]
    private let alertTitle = XCUIApplication().staticTexts[Constants.alertTitleId]
    private let alertBody = XCUIApplication().staticTexts[Constants.alertBodyId]
    
    
    enum Constants {
        static var pageId = "SEARCH_VIEW"
        static var textFieldId = "GF_TEXT_FIELD"
        static var buttonId = "GF_BUTTON"
        static var tabbarId = "TAB_BAR"
        static var logoId = "LOGO_IMAGE"
        static var alertId = "GF_ALERT_VIEW"
        static var alertButtonId = "ALERT_BUTTON"
        static var alertTitleId = "GF_TITLE_LABEL"
        static var alertBodyId = "GF_BODY_LABEL"
    }
    
    @discardableResult
    func checkPage() -> Self {
        _ = rootView.waitForExistence(timeout: 10)
        return self
    }
    
    @discardableResult
    func tapButton() -> Self {
        _ = button.waitForExistence(timeout: 5)
        XCTAssertTrue(button.exists, "Кнопка с названием \(button.label) существует")
        button.tap()
        return self
    }

    @discardableResult
    func checkAlertName(text: String) -> Self {
        _ = alert.waitForExistence(timeout: 5)
        XCTAssertEqual(text, alertTitle.label)
        return self
    }
    
    @discardableResult
    func checkAlertBody(text: String) -> Self {
        _ = alert.waitForExistence(timeout: 5)
        XCTAssertEqual(text, alertBody.label)
        return self
    }
    
    @discardableResult
    func tapAlertButton() -> Self {
        _ = alertButton.waitForExistence(timeout: 5)
        XCTAssertTrue(alertButton.exists, "Кнопка с названием \(alertButton.label) существует")
        alertButton.tap()
        return self
    }
    
    @discardableResult
    func tapLogo() -> Self {
        _ = logo.waitForExistence(timeout: 5)
        XCTAssertTrue(logo.exists, "Лого существует")
        logo.tap()
        return self
    }
    
    @discardableResult
    func getFollowers(text: String) -> FollowersPage {
        typeTextField(text: text)
        tapLogo()
        tapButton()
        return FollowersPage()
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
