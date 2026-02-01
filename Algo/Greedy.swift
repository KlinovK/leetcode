//
//  Greedy.swift
//  Algoritmization
//
//  Created by Константин Клинов on 09/01/26.
//

import Foundation

func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
    
    let sorted = costs.sorted(by: <)
    
    var totalBars = 0
    
    var totalCoins = coins
    
    for cost in sorted {
        if totalCoins >= cost {
            totalBars += 1
            totalCoins -= cost
        } else {
            break
        }
    }
    
    
    return totalBars
    
}

func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
    var totalRocks
    let sortedBags = capacity.sorted(by: <)
    
    
}
