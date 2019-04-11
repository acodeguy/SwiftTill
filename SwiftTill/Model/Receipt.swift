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
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    private func buildPriceList(menuJSON: JSON) {
        for (name,price):(String, JSON) in menuJSON[0]["prices"][0] {
            self.priceList[name] = price.double
        }
    }
    
    func getPriceFor(itemName: String) -> Double {
        if self.priceList.contains(where: { $0.key == itemName }) {
            return self.priceList.filter( { $0.key == itemName })[0].value
        }
        return 0
    }
    
    func calculateTotal() -> Double {
        var total: Double = 0
        for item in items {
            total += self.getPriceFor(itemName: item.key)
        }
        return total + (total * self.taxRate)
    }
}
