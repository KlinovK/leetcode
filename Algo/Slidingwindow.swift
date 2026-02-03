//
//  Slidingwindow.swift
//  Algoritmization
//
//  Created by Константин Клинов on 09/01/26.
//

import Foundation

func countGood(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    var left = 0
    var freq: [Int: Int] = [:]
    var pairs = 0
    
    for right in 0..<nums.count {
        // Add right element
        pairs += freq[nums[right], default: 0]
        freq[nums[right], default: 0] += 1
        
        // Shrink window while good
        while pairs >= k {
            result += nums.count - right
            freq[nums[left]]! -= 1
            pairs -= freq[nums[left]]!
            left += 1
        }
    }
    
    return result
}

func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    guard nums.count >= 3 else { return 0 }
    
    var total = 0
    var current = 0  // Count of arithmetic slices ending at current position
    
    for i in 2..<nums.count {
        // Check if the last 3 elements form an arithmetic sequence
        if nums[i] - nums[i - 1] == nums[i - 1] - nums[i - 2] {
            current += 1
            total += current
        } else {
            current = 0
        }
    }
    
    return total
}

func angleClock(_ hour: Int, _ minutes: Int) -> Double {
    
//    Example: What's the angle at 3:15?
//
//    θ = |30(3) - 5.5(15)|
//    θ = |90 - 82.5|
//    θ = 7.5°
//
//    Example: What's the angle at 9:00?
//
//    θ = |30(9) - 5.5(0)|
//    θ = |270 - 0|
//    θ = 270°
//    Since 270° > 180°, the smaller angle is 360° - 270° = 90°
    let resultAngle = abs(Double(hour) * 30.0 - Double(minutes) * 5.5)
    return resultAngle > 180 ? 360.0 - resultAngle : resultAngle
}

func longestNiceSubarray(_ nums: [Int]) -> Int {
    var maxLength = 0
    var left = 0
    var used = 0  // Tracks which bits are used in current window
    
    for right in 0..<nums.count {
        // Shrink window while there's a bit conflict
        while used & nums[right] != 0 {
            used ^= nums[left]
            left += 1
        }
        
        // Add current number to window
        used |= nums[right]
        maxLength = max(maxLength, right - left + 1)
    }
    
    return maxLength
}

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
