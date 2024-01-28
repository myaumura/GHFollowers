//
//  GHFollowersUITests.swift
//  GHFollowersUITests
//
//  Created by Kirill Gusev on 28.01.2024.
//

import XCTest

final class GHFollowersUITests: XCTestCase {

    override func setUpWithError() throws {
      
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields["Enter a username"]
        XCTAssertTrue(textField.exists)
        let button = app.buttons["Get Followers"]
        XCTAssertTrue(button.exists)
        
        guard textField.exists && button.exists else { return }
        
        textField.tap()
        textField.typeText("myaumura")
        app.keyboards.buttons["go"].tap()
        
        let username = app.staticTexts["myaumura"]
        XCTAssertTrue(username.exists)
     
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
