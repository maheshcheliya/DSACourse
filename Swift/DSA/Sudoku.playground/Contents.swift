import UIKit
func sudoku(_ grid: inout [[Int]]) -> Bool {
    // Base case
    //fill sudoku
    var row = -1
    var col = -1
    
    var isEmpty = true
    for i in 0..<grid.count {
        for j in 0..<grid.count {
            if(grid[i][j] == 0) {
                
                row = i
                col = j
                
                isEmpty = false
                break
            }
        }
        if(!isEmpty) {
            break
        }
    }
    
    if(isEmpty) {
        return true
    }
    
   for i in 1...9 {
        if(isSafe(grid, row, col, i)) {
            grid[row][col] = i
            
            if(sudoku(&grid)) {
                return true
            }
            grid[row][col] = 0
        }
    }
    
    return false
}
// first time, it will check position first row and first column, if 1 is safe to place there or not

func isSafe(_ grid: [[Int]],_ row: Int,_ col: Int,_ value: Int) -> Bool {
    // check for each column in given row
    for i in 0..<grid[row].count {
        if(grid[row][i] == value) {
            return false
        }
    }
    
    // check for each row in given column
    for i in 0..<grid.count {
        if(grid[i][col] == value) {
            
            return false
        }
    }
    
    // check in 3x3 grid
    // if my location is 5,7
    // startrow will be = 5 - 2 = 3 (5%3 = 2), below for loop will check for 3,4,5 position in row
    // startcol will be = 7 - 1 = 6 (7%3 = 1), below for loop will check for 6,7,8 position in column
    
    let startRow = row - row % 3
    let startCol = col - col % 3
    
    for i in startRow..<startRow + 3 {
        for j in startCol..<startCol + 3 {
            if(grid[i][j] == value) {
                
                return false
            }
        }
    }
    return true
}
var grid = [[3, 0, 6, 5, 0, 8, 4, 0, 0],
            [5, 2, 0, 0, 0, 0, 0, 0, 0],
            [0, 8, 7, 0, 0, 0, 0, 3, 1],
            [0, 0, 3, 0, 1, 0, 0, 8, 0],
            [9, 0, 0, 8, 6, 3, 0, 0, 5],
            [0, 5, 0, 0, 9, 0, 6, 0, 0],
            [1, 3, 0, 0, 0, 0, 2, 5, 0],
            [0, 0, 0, 0, 0, 0, 0, 7, 4],
            [0, 0, 5, 2, 0, 6, 3, 0, 0 ]]
sudoku(&grid)
for value in grid {
    print(value)
}
