//
//  hard.swift
//  Algoritmization
//
//  Created by Константин Клинов on 04/02/26.
//

import Foundation

func longestSubsequenceRepeatedK(_ s: String, _ k: Int) -> String {
    
    var currentLongestSize = s.count / k
    var currentLongest: String = ""
    while currentLongestSize > 0 {
        currentLongest = Array(s)[0...currentLongestSize]
        var charToFrequency: [Character: Int] = [:]
        
        for char in currentLongest {
            
            charToFrequency[char, default: 0] += 1
            
        }
        
        for i in stride(from: 0, to: s.count, by: currentLongestSize) {
            var totalRepeates = 0
            let currenSlise = Array(s])[i..<i+currentLongestSize]
            var currentDict = charToFrequency
            
            for char in currenSlise {
                if currentDict.isEmpty {
                    totalRepeates += 1
                }
                                
                if currentDict[char] == nil {
                    continue
                } else {
                    currentDict[char] -= 1
                }
                
            }
            
            if totalRepeates == k {
                currentLongestSize -= 1
                break
            }
            
        }
        
        
        
    }
    
    return currentLongest
    
}
