//
//  Simple.swift
//  Algoritmization
//
//  Created by Константин Клинов on 07/01/26.
//

import Foundation

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
