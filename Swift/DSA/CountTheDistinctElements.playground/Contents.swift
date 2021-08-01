import UIKit

var str = "Count the distinct elements in every window of size k"

func distinctElements(_ arr: [Int],_ k: Int) -> [Int] {
    var mySet = [Int:Int]()
    var low = 0
    var resultArr = [Int]()
    for i in 0..<arr.count {
        
        if let value = mySet[arr[i]] {
            mySet[arr[i]] = value + 1
        } else {
            mySet[arr[i]] = 1
        }
        
        if(i-low == k-1) {
            
            resultArr.append(mySet.count)
            
            if let value = mySet[arr[low]] {
                if(value == 1) {
                    mySet.removeValue(forKey: arr[low])
                } else {
                    mySet[arr[low]] = value - 1
                }
            }
            low += 1
        }
    }
    return resultArr
}
let arr = [1,2,2,1,3,1,1,3]
let res = distinctElements(arr, 4)
print(res)
