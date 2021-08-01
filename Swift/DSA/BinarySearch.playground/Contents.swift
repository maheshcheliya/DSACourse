import UIKit

var str = "Binary Search"
// we need sorted array to achieve our goal using binary search

// binary search using while loop
func binarySearch(_ arr: inout [Int], value: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    
    while (start <= end) {
        let middle = (start + end) / 2
        print("start:\(start)- end : \(end) - middle : \(middle) - element : \(arr[middle])")
        
        if(value == arr[middle]) {
            return middle
        } else if (value > arr[middle]) {
            start = middle + 1
        } else {
            end = middle - 1
        }
    }
    return -1
}
var arr = [1,2,3,4,5,6,7,8,9,10,12,35,78,98,533]
var result = binarySearch(&arr, value: 98)

// binary seach recursively
func binarySearch(_ arr: inout [Int], value: Int ,low: Int, high: Int) -> Int {
    if(low > high) {
        return -1
    }
    let middle = (low + high) / 2
    if(value == arr[middle]) {
        return middle
    }
    if(value > arr[middle]) {
        return binarySearch(&arr, value: value, low: middle + 1, high: high)
    }
    return binarySearch(&arr, value: value, low: low, high: middle - 1)
}

result = binarySearch(&arr, value: 98, low: 0, high: arr.count - 1)
print(result)
