//
//  hashmap.swift
//  Algoritmization
//
//  Created by Константин Клинов on 08/01/26.
//

import Foundation

func numSplits(_ s: String) -> Int {
    let arr = Array(s)
    var goodSplits: Int = 0
    
    func isGoodSplit(left: [Character], right: [Character]) -> Bool {
        Set(left).count == Set(right).count
    }
    
    for i in 0..<arr.count-1 {
        if isGoodSplit(left: Array(arr[0..<i]), right: Array(arr[i+1..<arr.count])) {
            goodSplits += 1
        }
    }
    
    return goodSplits
    
}
