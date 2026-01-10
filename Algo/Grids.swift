//
//  Grids.swift
//  Algoritmization
//
//  Created by Константин Клинов on 09/01/26.
//

import Foundation

func printVertically(_ s: String) -> [String] {
    // Handle edge cases
    guard !s.isEmpty else { return [] }
    
    // Split into words instead of characters
    let grid = s.split(separator: " ").map { Array($0) }
    
    guard !grid.isEmpty else { return [] }
    
    // Find the maximum word length
    let maxCols = grid.map { $0.count }.max() ?? 0
    var result = [String]()
    
    // Check each column (position in words)
    for col in 0..<maxCols {
        var colString = ""
        for row in 0..<grid.count {
            if col < grid[row].count {
                colString.append(grid[row][col])
            } else {
                colString.append(" ")
            }
        }
        // Remove trailing spaces
        result.append(colString)
    }
    
    return result
}

func minAbsDiff(_ grid: [[Int]], _ k: Int) -> [[Int]] {
    
    let rowsCount = grid.count
    let colsCount = grid[0].count
    
    // Edge case: if k is larger than grid dimensions
    if k > rowsCount || k > colsCount {
        return []
    }
    
    let numPositionRows = rowsCount - k + 1
    let numPositionCols = colsCount - k + 1
    
    var result: [[Int]] = []
    
    for row_start in 0..<numPositionRows {
        var rowResult: [Int] = []
        
        for col_start in 0..<numPositionCols {
            // Collect all unique values in the current k x k submatrix
            var uniqueValues = Set<Int>()
            for i in row_start..<(row_start + k) {
                for j in col_start..<(col_start + k) {
                    uniqueValues.insert(grid[i][j])
                }
            }
            
            // Convert to sorted array for easier comparison
            let sortedValues = uniqueValues.sorted()
            
            var minAbsDiff = Int.max
            
            // Compare consecutive values in sorted array
            for i in 0..<(sortedValues.count - 1) {
                let diff = sortedValues[i + 1] - sortedValues[i]
                minAbsDiff = min(minAbsDiff, diff)
            }
            
            // If there's only one unique value, min diff is 0
            if sortedValues.count == 1 {
                minAbsDiff = 0
            }
            
            rowResult.append(minAbsDiff)
        }
        
        result.append(rowResult)
    }
    
    return result
}
