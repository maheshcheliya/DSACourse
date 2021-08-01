import UIKit
// Majority means more than 50% elements

func majorityElements(_ arr: [Int]) -> Int {
    if (arr.count == 0) {
        return 0
    }
    
    var ansIndex = 0
    var count = 1
    
    for i in 1..<arr.count {
        if(arr[i] == arr[ansIndex]) {
            count += 1
        } else {
            count -= 1
        }
        
        if(count == 0) {
            ansIndex = i
            count = 1
        }
    }
    var highest = 0
    for i in 0..<arr.count {
        if(arr[i] == arr[ansIndex]) {
            highest += 1
        }
    }
    
    if (highest > (arr.count / 2)) {
        return arr[ansIndex]
    }
    return -1
}
let arr = [2,2,4,4,1,1,4,1,4,4,1,1,4,4,2,4,4]
let res = majorityElements(arr)
print(res)
