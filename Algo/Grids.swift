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

func largestMagicSquare(_ grid: [[Int]]) -> Int {
    let rows = grid.count
    if rows == 0 { return 0 }
    let cols = grid[0].count
    
    // Try sizes from largest to smallest
    for size in stride(from: min(rows, cols), through: 1, by: -1) {
        // Try all possible top-left corners for this size
        for row in 0...(rows - size) {
            for col in 0...(cols - size) {
                if isMagicSquare(grid, row: row, col: col, size: size) {
                    return size
                }
            }
        }
    }
    
    return 0
}

func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
    let rows = mat.count
    let cols = mat[0].count
    if rows == 0 || cols == 0 { return 0 }
    
    // Build prefix sum array
    var prefix = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
    
    for r in 1...rows {
        for c in 1...cols {
            prefix[r][c] = mat[r-1][c-1] + prefix[r-1][c] + prefix[r][c-1] - prefix[r-1][c-1]
        }
    }
    
    // Binary search or linear search for maximum size
    var maxSize = 0
    
    for size in 1...min(rows, cols) {
        var found = false
        for row in size...rows {
            for col in size...cols {
                // Calculate sum of square using prefix sums
                let sum = prefix[row][col]
                        - prefix[row-size][col]
                        - prefix[row][col-size]
                        + prefix[row-size][col-size]
                
                if sum <= threshold {
                    found = true
                    maxSize = size
                    break
                }
            }
            if found { break }
        }
    }
    
    return maxSize
}

func isMagicSquare(_ grid: [[Int]], row: Int, col: Int, size: Int) -> Bool {
    // Calculate target sum from first row
    var targetSum = 0
    for c in col..<(col + size) {
        targetSum += grid[row][c]
    }
    
    // Check all rows
    for r in row..<(row + size) {
        var rowSum = 0
        for c in col..<(col + size) {
            rowSum += grid[r][c]
        }
        if rowSum != targetSum {
            return false
        }
    }
    
    // Check all columns
    for c in col..<(col + size) {
        var colSum = 0
        for r in row..<(row + size) {
            colSum += grid[r][c]
        }
        if colSum != targetSum {
            return false
        }
    }
    
    // Check main diagonal
    var mainDiagSum = 0
    for i in 0..<size {
        mainDiagSum += grid[row + i][col + i]
    }
    if mainDiagSum != targetSum {
        return false
    }
    
    // Check anti-diagonal
    var antiDiagSum = 0
    for i in 0..<size {
        antiDiagSum += grid[row + i][col + size - 1 - i]
    }
    if antiDiagSum != targetSum {
        return false
    }
    
    return true
}

    
