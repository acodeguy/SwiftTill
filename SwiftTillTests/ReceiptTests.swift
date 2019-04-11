//
//  Receipt.swift
//  SwiftTillTests
//
//  Created by Andrew on 11/04/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import XCTest
@testable import SwiftTill

class SwiftTillTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItemsCanBeAddedToAReceipt() {
        let receipt = Receipt()
        XCTAssertFalse(receipt.hasItems())
        receipt.addItem(itemName: "Cafe Latte")
        XCTAssertTrue(receipt.hasItems())
    }

}
