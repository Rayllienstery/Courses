//
//  CICDCourseAppUITests.swift
//  CICDCourseAppUITests
//
//  Created by Konstantin Kolosov on 12.02.2024.
//

import XCTest

final class CICDCourseAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app/*@START_MENU_TOKEN@*/.staticTexts["Counter"]/*[[".buttons[\"Counter\"].staticTexts[\"Counter\"]",".staticTexts[\"Counter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Button 1"]/*[[".buttons[\"Button 1\"].staticTexts[\"Button 1\"]",".staticTexts[\"Button 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Button 2"]/*[[".buttons[\"Button 2\"].staticTexts[\"Button 2\"]",".staticTexts[\"Button 2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Button 3"]/*[[".buttons[\"Button 3\"].staticTexts[\"Button 3\"]",".staticTexts[\"Button 3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Button 4"]/*[[".buttons[\"Button 4\"].staticTexts[\"Button 4\"]",".staticTexts[\"Button 4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        XCTAssertEqual(app.staticTexts["Button 5"].exists, true)
    }
}
