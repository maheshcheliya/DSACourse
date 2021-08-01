import UIKit

var str = "Rain Water Trapping Problem"

func waterTrappingProblem(_ arr: [Int]) -> Int {
    if(arr.count == 0) { return 0 }
    var leftArr = [Int](repeating: 0, count: arr.count)
    var rightArr = [Int](repeating: 0, count: arr.count)
    
    leftArr[0] = arr[0]
    rightArr[arr.count-1] = arr[arr.count-1]
    
    var total = 0
    
    for i in 1..<arr.count {
        leftArr[i] = max(arr[i], leftArr[i-1])
    }
    
    for i in (0..<arr.count-1).reversed() {
        rightArr[i] = max(arr[i], rightArr[i+1])
    }
    
    for i in 0..<arr.count {
        let diff = min(leftArr[i], rightArr[i]) - arr[i]
        total += diff
    }
    
    return total
}

let arr = [3,1,2,4,0,1,3,2]
let result = waterTrappingProblem(arr)
print(result)





