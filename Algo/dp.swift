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
    
}
