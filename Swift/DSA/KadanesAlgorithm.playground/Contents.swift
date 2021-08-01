import UIKit
// Kadane's Algorithm - Largest sum contiguous sun array
func largestSumContiguousSubarray(_ arr: [Int]) -> Int {
    var largestSum = Int.min
    var currentSum = 0
    
    for i in 0..<arr.count {
        currentSum += arr[i]
        
        if(currentSum > largestSum) {
            largestSum = currentSum
        }
        
        if(currentSum < 0) {
            currentSum = 0
        }
    }
    return largestSum
}
//let arr = [-5,4,6,-3,4,-1]
//let arr = [1,-2,3,2,-6,4]
//let arr = [1,-2,3,2,-6,4, 100,-200]

let arr = [-100,-20,-30,-20,-2,-4,-4,-100,-200]
let res = largestSumContiguousSubarray(arr)
print(res)
