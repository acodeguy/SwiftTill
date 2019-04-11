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

    override func tearDown() {}

    func testItemsCanBeAddedToAReceipt() {
        receipt.addItem(itemName: "Cafe Latte")
        print("items: \(receipt.listItems())")
        XCTAssertTrue(receipt.listItems() == ["Cafe Latte":1])
    }
    
    func testMulitpleQuantitiesOfAnItemCanBeAddedAtOnce() {
        receipt.addItem(itemName: "Cappucino", quantity: 3)
        print("items: \(receipt.listItems())")
        XCTAssertTrue(receipt.listItems() == ["Cappucino":3])
    }

}
