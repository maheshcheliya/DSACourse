import UIKit
var str = "N Queen Problem - The N Queen is the problem of placing N chess queens on an N×N chessboard so that no two queens attack each other. For example, following is a solution for 4 Queen problem."
// outout
//[false, true, false, false]
//[false, false, false, true]
//[true, false, false, false]
//[false, false, true, false]


func nqueen(_ board: inout [[Bool]],_ row: Int,_ col: Int) -> Bool {
    if(row == board.count) {
        printBoard(arr: board)
        return true
    }
    for i in 0..<board[row].count {
        if(isSafe(board: board, row: row, col: i)) {
            board[row][i] = true
            if(nqueen(&board, row + 1, i)) {
                return true
            }
            board[row][i] = false
        }
    }
    return false
}
func printBoard(arr:[[Bool]]) {
    for value in arr {
        print(value)
    }
}
func isSafe(board:[[Bool]], row:Int, col: Int) -> Bool {
    var r = row
    var c = col
    
    // check left side horizontally
    while (c >= 0) {
        if(board[r][c]) {
            return false
        }
        c -= 1
    }
    
    // check upside vertically
    r = row - 1
    c = col
    while (r >= 0) {
        if(board[r][c]) {
            return false
        }
        r -= 1
    }
    
    // left up
    r = row - 1
    c = col - 1
    while (r >= 0 && c >= 0) {
        if(board[r][c]) {
            return false
        }
        r -= 1
        c -= 1
    }
    
    
    // right up
    r = row - 1
    c = col + 1
    
    while (r >= 0 && c < board[row].count) {
        if(board[r][c]) {
            return false
        }
        r -= 1
        c += 1
    }
    
    return true
}
var arr = [[Bool]](repeating: [false, false, false, false], count: 4)
let res = nqueen(&arr, 0, 0)
print(res)
