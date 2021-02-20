//
//  SwiftMonkeyExampleUITests.swift
//  SwiftMonkeyExampleUITests
//
//  Created by Dag Agren on 07/11/2016.
//  Copyright © 2016 Zalando SE. All rights reserved.
//

import XCTest
import SwiftMonkey

class SwiftMonkeyExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMonkey() {
        let application = XCUIApplication()

        // Initialise the monkey tester with the current device
        // frame. Giving an explicit seed will make it generate
        // the same sequence of events on each run, and leaving it
        // out will generate a new sequence on each run.
        let monkey = Monkey(frame: application.frame)
        //let monkey = Monkey(seed: 123, frame: application.frame)

        // Add actions for the monkey to perform. We just use a
        // default set of actions for this, which is usually enough.
        // Use either one of these but maybe not both.
        
        // XCTest private actions seem to work better at the moment.
        // before Xcode 10.1, you can use
        // monkey.addDefaultXCTestPrivateActions()
        
        // after Xcode 10.1 We can only use public API
//        monkey.addDefaultXCTestPublicActions(app: application)
        
        // UIAutomation actions seem to work only on the simulator.
        monkey.addDefaultUIAutomationActions()
        
        // Occasionally, use the regular XCTest functionality
        // to check if an alert is shown, and click a random
        // button on it.
        monkey.addXCTestTapAlertAction(interval: 100, application: application)

        // Run the monkey test indefinitely.
        monkey.monkeyAround()
    }
}
