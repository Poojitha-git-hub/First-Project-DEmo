//
//  HomePage.Swift
//  VolleyUITests
//
//  Created by Poojitha Mattapalli on 6/9/25.
//  Copyright © 2025 Masilotti.com. All rights reserved.
//

import Foundation
import XCTest

class HomePage {
    let app = XCUIApplication();
    app.launch()
    app.activate()
    XCTAssertTrue(app.staticTexts["Manage Team"].exists)
    app.staticTexts["Manage Team"].tap()
}
