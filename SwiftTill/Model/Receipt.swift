//
//  Receipt.swift
//  SwiftTill
//
//  Created by Andrew on 11/04/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation

class Receipt {
    
    private var items: [String:Int] = [:]
      
    func addItem(itemName: String, quantity: Int = 1) {
        self.items[itemName] = self.items[itemName] ?? 0 + quantity
    }
    
    func listItems() -> [String:Int] {
        return self.items
    }
}
