//
//  Receipt.swift
//  SwiftTill
//
//  Created by Andrew on 11/04/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation
import SwiftyJSON

class Receipt {
    
    private var items: [String:Int] = [:]
    private var priceListFilename = "hipstercoffee"
    private var priceList: [String:Double] = [:]
    private var taxRate: Double = 0.2
    private var shopDetails: [String:String] = [
        "shopName": "Java Joe's",
        "address": "Coffee Corner",
        "phone": "123456789"
    ]
    private var dateGenerated: Date = Date()
    
    init() {
        self.setPrices()
    }
      
    func addItem(itemName: String, quantity: Int = 1) {
        self.items[itemName] = self.items[itemName] ?? 0 + quantity
    }
    
    func listItems() -> [String:Int] {
        return self.items
    }
    
    func setPrices() {
        if let path = Bundle.main.path(forResource: priceListFilename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                buildPriceList(menuJSON: jsonObj)
                getShopDetails(dataJSON: jsonObj[0])
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    private func buildPriceList(menuJSON: JSON) {
        for (name,price):(String, JSON) in menuJSON[0]["prices"][0] {
            self.priceList[name] = price.doubleValue
        }
    }
    
    private func getShopDetails(dataJSON: JSON) {
        self.shopDetails["shopName"] = dataJSON["shopName"].stringValue
        self.shopDetails["address"] = dataJSON["address"].stringValue
        self.shopDetails["phone"] = dataJSON["phone"].stringValue
    }
    
    func getPriceFor(itemName: String) -> Double {
        if self.priceList.contains(where: { $0.key == itemName }) {
            return self.priceList.filter( { $0.key == itemName })[0].value
        }
        return 0
    }
    
    func calculateTotal(taxInclusive: Bool = false) -> Double {
        var total: Double = 0
        for item in self.items {
            let price = self.getPriceFor(itemName: item.key)
            total += price * Double(item.value)
        }
        if taxInclusive {
            return total + calculateTaxAmount()
        }
        return total
    }
    
    func calculateTaxAmount() -> Double {
        return calculateTotal() * self.taxRate
    }
    
    func generate() -> String {
        var receipt = "\(self.formatDate(date: self.dateGenerated))\n"
            + "\(shopDetails["shopName"]!)\n"
            + "\(shopDetails["address"]!)\n"
            + "\(shopDetails["phone"]!)\n"
        for item in self.items.sorted(by: { $0 < $1 }) {
            let price = self.getPriceFor(itemName: item.key) * Double(item.value)
            receipt = receipt + "\(item.value)x \(item.key): \(formatCurrency(number: price))\n"
        }
        
        receipt = receipt + "- - - - - - - - - -\n"
            + "SUB-TOTAL: \(formatCurrency(number: calculateTotal()))\n"
            + "TAX @ 20%: \(formatCurrency(number: calculateTaxAmount()))\n"
            + "TOTAL: £\(formatCurrency(number: calculateTotal(taxInclusive: true)))"
        return receipt
    }
    
    func formatCurrency(number: Double) -> String {
        return String(format: "%.02f", number)
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_GB")
        return dateFormatter.string(from: date)
    }
}
