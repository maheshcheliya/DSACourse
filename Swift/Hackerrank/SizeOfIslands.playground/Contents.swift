import UIKit

var str = "Hackerrank - Size of islands"

func sizeOfIslands(grid: [[Int]]) -> [Int]{
    var matrix = grid
    var sizeArray = [Int]()
    for (i, array) in matrix.enumerated() {
        for (j, value) in array.enumerated() {
            if (value == 1) {
                let size = visit(matrix: &matrix, i: i, j: j)
                if(size > 0) {
                    sizeArray.append(size)
                }
            }
        }
    }
    return sizeArray
}

func visit(matrix : inout [[Int]], i:Int, j:Int) -> Int {
    if (i < 0 || i >= matrix.count || j >= matrix[i].count || j < 0 ) {
        return 0
    }
    if(matrix[i][j] == 1) {
        matrix[i][j] = 0
        let right = visit(matrix: &matrix, i: i, j: j+1) // right
        let left = visit(matrix: &matrix, i: i, j: j-1) // left
        let down = visit(matrix: &matrix, i: i+1, j: j) // bottom
        let up = visit(matrix: &matrix, i: i-1, j: j) // up
        return right + left + down + up + 1
    }
    return 0
}
//let matrix = [
//    [0,0,0,0,0],
//    [0,0,0,0],
//    [0,0,0,0,0],
//    [0,0,0,0,0,0,0,0],
//    [1]
//]
//    let matrix = [
//        [1,0,0,1,0],
//        [1,0,1,0,0],
//        [0,0,1,0,1],
//        [1,0,1,0,1],
//        [1,0,1,1,0]
//    ]
//
//    let matrix = [
//        [1,1,1,1,1],
//        [1,0,1,0,1],
//        [0,0,0,0,0],
//        [1,0,1,0,1],
//        [1,1,1,1,1]
//    ]
//
//    let matrix = [
//        [1,1,1,1,1],
//        [1,0,1,0,1],
//        [0,0,1,0,0],
//        [1,0,1,0,1],
//        [1,1,1,1,1]
//    ]

    let matrix = [
        [0,0,1,0,1],
        [],
        [1,1,1,0,1],
        [1,0,0,1,0,1,1,1],
        [1]
    ]
let result = sizeOfIslands(grid: matrix)
print(result.sorted())
