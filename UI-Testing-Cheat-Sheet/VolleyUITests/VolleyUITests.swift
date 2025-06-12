//
//  VolleyUITests.swift
//  VolleyUITests
//
//  Created by Poojitha Mattapalli on 6/4/25.
//  Copyright © 2025 Masilotti.com. All rights reserved.
//

import XCTest

final class VolleyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.activate()
        app/*@START_MENU_TOKEN@*/.staticTexts["Manage Team"]/*[[".cells.staticTexts[\"Manage Team\"]",".staticTexts[\"Manage Team\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Back"]/*[[".navigationBars.buttons[\"Back\"]",".buttons.firstMatch",".buttons[\"Back\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                app/*@START_MENU_TOKEN@*/.staticTexts["Manage Roster"]/*[[".cells.staticTexts[\"Manage Roster\"]",".staticTexts[\"Manage Roster\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    @MainActor
    func test_VerifyManageTeam(){
        let app = XCUIApplication()
        app.launch()
        app.activate()
        XCTAssertTrue(app.staticTexts["Manage Team"].exists)
        app/*@START_MENU_TOKEN@*/.staticTexts["Manage Team"]/*[[".cells.staticTexts[\"Manage Team\"]",".staticTexts[\"Manage Team\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(2)  // Pauses for 2 seconds
        let teamNameField = app.textFields["Team Name"]
        if teamNameField.exists {
            teamNameField.tap()
            teamNameField.typeText("RCB")
           
        }
        app.keyboards.buttons["Done"].tap()
        
        let skillSlider = app.sliders.element(boundBy: 0)
        skillSlider.adjust(toNormalizedSliderPosition: 0.7)
        sleep(2)
       
      
        let pickers = app.pickerWheels
        pickers.element(boundBy: 0).adjust(toPickerWheelValue: "6 attackers")
        pickers.element(boundBy: 1).adjust(toPickerWheelValue: "1 setter")
        
            
            
    }
    @MainActor
    func testPickelveiwsWatch(){
        let app = XCUIApplication()
        app.launch()
        app.activate()
        XCTAssertTrue(app.staticTexts["Manage Team"].exists)
        app/*@START_MENU_TOKEN@*/.staticTexts["Manage Team"]/*[[".cells.staticTexts[\"Manage Team\"]",".staticTexts[\"Manage Team\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let picker = app.pickerWheels.element(boundBy:0)
        let desiredValue = "6 attackers"
        XCTAssertTrue(picker.exists, "Picker wheel not found")
var attempts = 0
        let maxAttempts = 10

        while picker.value as? String != desiredValue && attempts < maxAttempts {
            picker.swipeUp()
            attempts += 1
        }

        XCTAssertEqual(picker.value as? String, desiredValue)
        
    }
       

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
