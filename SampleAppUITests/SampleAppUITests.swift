//
//  SampleAppUITests.swift
//  SampleAppUITests
//
//  Created by Ejay Torres on 11/21/24.
//

import XCTest
import SwiftUI

final class SampleAppUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication() // Initializes the XCTest app
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    @MainActor
    func testInsert() throws {
        let button = app.buttons["Button 1"]
        XCTAssertTrue(button.exists)
        button.tap()
        let logs = app.buttons["Logs button"].firstMatch
        logs.tap()
        let collectionViewsQuery = app.collectionViews
        let firstCell = collectionViewsQuery.cells.element(boundBy: 0)
        let firstCellValue = firstCell.staticTexts.firstMatch.label
        XCTAssertTrue(firstCellValue.contains("Button 1 pressed"))
        
    }
}
