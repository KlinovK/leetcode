//
//  dp.swift
//  Algoritmization
//
//  Created by Константин Клинов on 08/01/26.
//

import Foundation

class DP {
    
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
