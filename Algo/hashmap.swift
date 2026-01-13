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

func minimumLength(_ s: String) -> Int {
    var charToCount: [Character: Int] = [:]
    
    for char in s {
        charToCount[char, default: 0] += 1
    }
 //   "abaacbcbb"
//    a = 3 1
//    b = 4 2
//    c = 2 2
    
    var result = 0
    for count in charToCount.values {
        result += count % 2 == 0 ? 2 : 1
    }
    
    return result
    // 5
}
