//
//  Receipt.swift
//  SwiftTill
//
//  Created by Andrew on 11/04/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation

class Receipt {
    
    private var items: [String]
    
    init() {
        self.items = []
    }
    
    func addItem(itemName: String, quantity:Int = 0) {
        self.items.append(itemName)
    }
    
    func hasItems() -> Bool {
        return !self.items.isEmpty
    }
}
