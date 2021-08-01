import UIKit

// single stock buy
func stock(_ arr: [Int]) -> Int {
    var maxNumber = 0
    var maxNumberIndex = 0
    var minNumberIndex = 0
    var minNumber = arr[0]
    var maxProfit = 0
    
    for i in 0..<arr.count {
        if(minNumber > arr[i]) {
            minNumber = arr[i]
            minNumberIndex = i
        }
        let profit = arr[i] - minNumber
        if(maxProfit < profit) {
            maxNumber = arr[i]
            maxNumberIndex = i
            maxProfit = profit
        }
    }
//    print(maxNumber)
//    print(minNumber)
//
//    print(maxNumberIndex)
//    print(minNumberIndex)
    
    
// below solution using O(n) space complexity, so above is optimized in O(1)
//    var tempArr = arr
//    var i = arr.count - 1
//
//    while(i > 0) {
//        if(tempArr[i] > tempArr[i-1]) {
//            tempArr[i-1] = tempArr[i]
//        }
//        i -= 1
//    }
//
//    var profit = Int.min
//    for i in 0..<arr.count {
//        let temp = tempArr[0] - arr[i]
//        if (temp > profit) {
//            profit = temp
//        }
//    }
//
    return maxProfit
}
var arr = [1,5,10,7,4,9,30]
// arr = [3]
let res = stock(arr)
print(res)



func multipleTransaction(_ arr:[Int]) -> Int {
    var maxProfit = 0
    
    for i in 1..<arr.count {
        if(arr[i] > arr[i-1]) {
            maxProfit += arr[i] - arr[i-1]
        }
    }
    return maxProfit
}

let temparr = [5,2,6,1,4,7,3,6]
let result = multipleTransaction(temparr)
print(result)
