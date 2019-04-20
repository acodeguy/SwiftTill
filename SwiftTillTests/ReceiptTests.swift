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
        XCTAssertTrue(receipt.listItems() == ["Cappucino":3])
    }
    
    func testParsesAndSetsItsPricesFromTheSuppliedJSONFile() {
        XCTAssertTrue(receipt.getPriceFor(itemName: "Cafe Latte") == 4.75)
        XCTAssertTrue(receipt.getPriceFor(itemName: "Cappucino") == 3.85)
    }
    
    func testCanReturnTotalAmountDueIncludingTax() {
        receipt.addItem(itemName: "Cappucino")
        receipt.addItem(itemName: "Cafe Latte")
        XCTAssertTrue(receipt.calculateTotal(taxInclusive: true) == 10.32)
    }
    
    func testCanGenerateAReceipt() {
        receipt.addItem(itemName: "Cappucino", quantity: 2)
        receipt.addItem(itemName: "Cafe Latte")
        receipt.addItem(itemName: "Affogato")
        receipt.addItem(itemName: "Tiramisu")
        let expectedReceiptOutput: String = "\(receipt.formatDate(date: Date()))\n"
            + "The Coffee Connection\n"
            + "123 Lakeside Way\n"
            + "16503600708\n"
            + "1x Affogato: 14.80\n"
            + "1x Cafe Latte: 4.75\n"
            + "2x Cappucino: 7.70\n"
            + "1x Tiramisu: 11.40\n"
            + "- - - - - - - - - -\n"
            + "SUB-TOTAL: 38.65\n"
            + "TAX @ 20%: 7.73\n"
            + "TOTAL: £46.38"
        XCTAssertEqual(receipt.generate(), expectedReceiptOutput)
    }
    
    func testPaymentCanBeTakenFromTheTotalDue() {
        receipt.addItem(itemName: "Cappucino")
        let totalDueIncludingTax = receipt.calculateTotal(taxInclusive: true)
        let amountOutstanding = receipt.acceptPayment(amount: totalDueIncludingTax)
        XCTAssertEqual(amountOutstanding, 0)
    }

}
