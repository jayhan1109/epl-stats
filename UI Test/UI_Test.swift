//
//  UI_Test.swift
//  UI Test
//
//  Created by Jeongho Han on 2021-07-11.
//

import XCTest

class UI_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIfStandingViewIsShown() throws {
        
        let app = XCUIApplication()
        let premierLeagueStaticText = app.staticTexts["Premier League"]
        premierLeagueStaticText.tap()
        app.buttons["crown.fill"].tap()
        let standingText = app.staticTexts["Standing"]
        
        XCTAssertTrue(standingText.exists)
    }
}
