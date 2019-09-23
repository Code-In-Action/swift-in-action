//
//  ItemStore.swift
//  Homepwner
//
//  Created by Go7hic on 2019/9/23.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems: [Item] = []
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
         let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}
