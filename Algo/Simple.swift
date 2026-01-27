//
//  Simple.swift
//  Algoritmization
//
//  Created by Константин Клинов on 07/01/26.
//

import Foundation

func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
    // 1. Sort the array so the closest numbers are neighbors
    let sortedArr = arr.sorted()
    var minAbsDiff = Int.max
    var result: [[Int]] = []
    
    // 2. First pass: find the actual minimum difference
    for i in 0..<(sortedArr.count - 1) {
        let diff = sortedArr[i + 1] - sortedArr[i]
        if diff < minAbsDiff {
            minAbsDiff = diff
        }
    }
    
    // 3. Second pass: collect all pairs with that difference
    for i in 0..<(sortedArr.count - 1) {
        if sortedArr[i + 1] - sortedArr[i] == minAbsDiff {
            // Append the pair as a single element [a, b]
            result.append([sortedArr[i], sortedArr[i + 1]])
        }
    }
    
    return result
}

func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
    var minScore = Int.max
    let sorted = nums.sorted()
    
    for i in 0..<(nums.count - k + 1) {
        // The difference is max - min of the window
                // In a sorted array, this is last element - first element
                let currentScore = sorted[i + k - 1] - sorted[i]
                minScore = min(minScore, currentScore)
        
    }
    
    return minScore
    
}

func minPairSum2(_ nums: [Int]) -> Int {
    let sorted = nums.sorted()
    var maxSum = 0
    let n = sorted.count
    
    for i in 0..<(n / 2) {
        maxSum = max(maxSum, sorted[i] + sorted[n - 1 - i])
    }
    
    return maxSum
}

func minimumPairRemoval(_ nums: [Int]) -> Int {
    
    func isNonDecreasing(_ nums: [Int]) -> Bool {
        for i in 1..<nums.count {
            if nums[i] < nums[i-1] {
                return false
            }
        }
        return true
    }
    
    var total = 0
    var currentArray = nums
    
    while !isNonDecreasing(currentArray) {
        var minSum = Int.max
        var minPairIndex = 0
        
        // Find the pair with minimum sum
        for i in 0..<currentArray.count-1 {
            let currentPairSum = currentArray[i] + currentArray[i+1]
            
            if currentPairSum < minSum {
                minSum = currentPairSum
                minPairIndex = i
            }
        }
        
        // Remove the pair and add their sum
        currentArray.remove(at: minPairIndex)
        currentArray.remove(at: minPairIndex) // After first removal, i+1 is now at index i
        currentArray.insert(minSum, at: minPairIndex)
        
        total += 1
    }
    
    return total
}
func largestEven(_ s: String) -> String {
    let reversed = Array(s.reversed())
    
    for i in 0..<reversed.count {
        if let digit = Int(String(reversed[i])), digit.isMultiple(of: 2) {
            return String(reversed[i...].reversed())
        }
    }
    
    return ""
}

func minProcessingTime(_ processorTime: [Int], _ tasks: [Int]) -> Int {
    // Sort processor times ascending (start earliest first)
    let sortedProcessors = processorTime.sorted()
    
    // Sort tasks descending (longest tasks first)
    let sortedTasks = tasks.sorted(by: >)
    
    // Number of tasks per processor (4 cores per processor)
    let tasksPerProcessor = tasks.count / processorTime.count
    
    var maximum = 0
    
    // Split tasks among processors
    var taskIndex = 0
    
    for processor in 0..<sortedProcessors.count {
        let startTime = sortedProcessors[processor]
        
        // Assign next 'tasksPerProcessor' tasks to this processor
        for _ in 0..<tasksPerProcessor {
            let finishTime = startTime + sortedTasks[taskIndex]
            maximum = max(maximum, finishTime)
            taskIndex += 1
        }
    }
    
    return maximum
}

func residuePrefixes(_ s: String) -> Int {
    var total = 0
    var distinctChars = Set<Character>()
    
    for (index, char) in s.enumerated() {
        distinctChars.insert(char)
        let prefixLength = index + 1
        
        if distinctChars.count == prefixLength % 3 {
            total += 1
        }
    }
    
    return total
}

func minBitwiseArray(_ nums: [Int]) -> [Int] {
    var ans = [Int]()
    
    for i in 0..<nums.count {
        ans.append(nums[i] ^ nums[0])
    }
    
    return ans
}


func nthPersonGetsNthSeat(_ n: Int) -> Double {
//    let n = 5
    let numerator = 1
//    let denominator = 5
//
//    // As decimal
    let decimal = Double(numerator) / Double(n)
//    print(decimal)  // Output: 0.2
//
//    // As string
//    print("\(numerator)/\(denominator)")  // Output: "1/5"
    
    return decimal
}

func arrangeWords(_ text: String) -> String {
    let words = text.lowercased().components(separatedBy: " ")
    let sorted = words.sorted(by: { $0.count < $1.count })
    var result = sorted.joined(separator: " ")
    
    // Capitalize first letter
    if let first = result.first {
        result = first.uppercased() + result.dropFirst()
    }
    
    return result
}
