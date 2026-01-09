//
//  StockSpanner.swift
//  Algoritmization
//
//  Created by Константин Клинов on 08/01/26.
//

import Foundation

class StockSpanner {
    
    var stack: [(price: Int, span: Int)] = []

    init() {
        
    }
    
    func next(_ price: Int) -> Int {
        var total = 1
        
        // Pop elements where price is less than or equal to current price
        // and accumulate their spans
        while !stack.isEmpty && stack.last!.price <= price {
            total += stack.removeLast().span
        }
        
        // Push current price with its total span
        stack.append((price, total))
        
        return total
    }
}
