//
//  dp.swift
//  Algoritmization
//
//  Created by Константин Клинов on 08/01/26.
//

import Foundation

class DP {
    
    func countBits(_ n: Int) -> [Int] {
        var dp: [Int] = []
        for i in 0...n {
            let binary = i.nonzeroBitCount

            dp.append(binary)
        }
        return dp
    }
    
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)
        
        var dp = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
        
        // Base case: if s2 is empty, delete all of s1
        for i in 1...s1.count {
            dp[i][0] = dp[i - 1][0] + Int(s1Chars[i - 1].asciiValue!)
        }
        
        // Base case: if s1 is empty, delete all of s2
        for j in 1...s2.count {
            dp[0][j] = dp[0][j - 1] + Int(s2Chars[j - 1].asciiValue!)
        }
        
        // Fill the DP table
        for i in 1...s1.count {
            for j in 1...s2.count {
                if s1Chars[i - 1] == s2Chars[j - 1] {
                    // Characters match, no deletion needed
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // Characters don't match, delete from s1 or s2
                    let deleteFromS1 = dp[i - 1][j] + Int(s1Chars[i - 1].asciiValue!)
                    let deleteFromS2 = dp[i][j - 1] + Int(s2Chars[j - 1].asciiValue!)
                    dp[i][j] = min(deleteFromS1, deleteFromS2)
                }
            }
        }
        
        return dp[s1.count][s2.count]
    }
    
    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let m = nums2.count
        var dp: [[Int]] = Array(repeating: Array(repeating: Int.min / 2, count: m + 1), count: n + 1)
        
        for i in 1...n {
            for j in 1...m {
                let product = nums1[i - 1] * nums2[j - 1]
                
                dp[i][j] = max(
                    product,                        // Start new
                    dp[i - 1][j - 1] + product,    // Extend previous
                    dp[i - 1][j],                   // Skip nums1[i-1]
                    dp[i][j - 1]                    // Skip nums2[j-1]
                )
            }
        }
        
        return dp[n][m]
    }
    
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var dp = Array(repeating: 0, count: days.count)
        
        for i in 0..<days.count {
            
            let j = i - 1, m = i - 7, k = i - 30
            dp[i] = min(
                dp[j] + costs[0],  // Buy 1-day pass for days[i]
                dp[k] + costs[1],  // Buy 7-day pass covering days[i]
                dp[m] + costs[2]   // Buy 30-day pass covering days[i]
            )
        }
        
        return dp[days.count - 1]
     
    }
    
}
