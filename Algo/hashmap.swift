//
//  hashmap.swift
//  Algoritmization
//
//  Created by Константин Клинов on 08/01/26.
//

import Foundation

func findDuplicate(_ paths: [String]) -> [[String]] {
    var contentToFiles: [String: [String]] = [:]
    
    for path in paths {
        let parts = path.split(separator: " ")
        let directory = String(parts[0])
        
        for file in parts.dropFirst() {
            let fileNameWithContent = file.split(separator: "(")
            let fileName = String(fileNameWithContent[0])
            let content = String(fileNameWithContent[1].dropLast())
            
            contentToFiles[content, default: []].append("\(directory)/\(fileName)")
        }
    }
    
    // Filter to only include groups with 2+ files and convert to array
    return contentToFiles.values.filter { $0.count >= 2 }.map { $0 }
}

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
