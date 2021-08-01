import UIKit
// find the largest subarray with equal no of 1 and 0
// arr = [1,1,0,1,1,0,0]


var str = "Find Sub array for given sum"
func subArrayForGivenSum(_ arr:[Int], _ sum : Int) -> [Int] {
    var currentSum = 0
    var start = 0
    var end = -1
    
    var map = [Int:Int]()
    
    for i in 0..<arr.count {
        currentSum += arr[i]
        
        if(currentSum - sum == 0) {
            start = 0
            end = i
            break
        }
        
        if let value = map[currentSum-sum] {
            start = value + 1
            end = i
            break
        }
        
        map[currentSum] = i
    }
    
    if(end == -1) {
        return []
    }
    return Array(arr[start...end])
}
let arr = [10,15,-5, 15, -10, 5]
let result = subArrayForGivenSum(arr, 5)
print(result)
