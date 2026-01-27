//
//  Slidingwindow.swift
//  Algoritmization
//
//  Created by Константин Клинов on 09/01/26.
//

import Foundation

func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
    var result: [Int] = []
    
    for i in 0..<nums.count {
        var currentAbsSum: Int = 0
        for j in 0..<nums.count {
            currentAbsSum += abs(nums[i] - nums[j])
        }
    }
    
    return result
 }

func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
    var result: [Int] = []
    
    for i in 0..<nums.count {
        var currentAbsSum: Int = 0
        for j in 0..<nums.count {
            currentAbsSum += abs(nums[i] - nums[j])
        }
        result.append(currentAbsSum)
    }
    
    return result
 }
