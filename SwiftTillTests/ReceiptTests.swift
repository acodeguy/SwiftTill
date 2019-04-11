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
    
    var receipt = Receipt()

    override func setUp() {
        receipt = Receipt()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItemsCanBeAddedToAReceipt() {
        XCTAssertFalse(receipt.hasItems())
        receipt.addItem(itemName: "Cafe Latte")
        XCTAssertTrue(receipt.hasItems())
    }
    
    func testMulitpleQuantitiesOfAnItemCanBeAddedAtOnce() {
        XCTAssertFalse(receipt.hasItems())
        receipt.addItem(itemName: "Cappucino", quantity: 3)
        XCTAssertTrue(receipt.hasItems())
    }

}
