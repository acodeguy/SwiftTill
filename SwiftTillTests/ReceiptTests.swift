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
        XCTAssertTrue(receipt.listItems() == ["Cafe Latte":1])
    }
    
    func testMulitpleQuantitiesOfAnItemCanBeAddedAtOnce() {
        receipt.addItem(itemName: "Cappucino", quantity: 3)
        print("items: \(receipt.listItems())")
        XCTAssertTrue(receipt.listItems() == ["Cappucino":3])
    }
    
    func testParsesAndSetsItsPricesFromTheSuppliedJSONFile() {
        XCTAssertTrue(receipt.getPriceFor(itemName: "Cafe Latte") == 4.75)
        XCTAssertTrue(receipt.getPriceFor(itemName: "Cappucino") == 3.85)
    }
    
    func testCanReturnTotalAmountDueIncludingTax() {
        receipt.addItem(itemName: "Cappucino")
        receipt.addItem(itemName: "Cafe Latte")
        XCTAssertTrue(receipt.calculateTotal() == 10.32)
    }

}
