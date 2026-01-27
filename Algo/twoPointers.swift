//
//  twoPointers.swift
//  Algoritmization
//
//  Created by Константин Клинов on 24/01/26.
//

import Foundation

func minPairSum(_ nums: [Int]) -> Int {
    let sorted = nums.sorted()
    var leftIndex = 0
    var rightIndex = sorted.count-1
    var maxSum = Int.min
    while leftIndex < rightIndex {
        maxSum = max(maxSum, sorted[leftIndex] + sorted[rightIndex])
        leftIndex += 1
        rightIndex -= 1
        
    }
    return maxSum
}
