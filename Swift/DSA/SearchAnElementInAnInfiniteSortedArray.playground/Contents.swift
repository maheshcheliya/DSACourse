import UIKit

var str = "Search an element in an infinite sorted array"
// this array size could be in billions, so it is not possible to do it in Linear time complexity, which is O(n)
// If we don't know the exact size of array, we can still find using this way.

var arr = [1,4,5,5,7,9,10,22,45,65,452,675,897,1120,1323,3132,4331,31311]

func infiniteArray(arr: inout [Int], value : Int) -> Int {
    var low = 0
    var high = 1
    while (arr[high] < value) {
        low = high
        high *= 2
        print(high)
    }
    return binarySearch(&arr, value: value, low: low, high: high)
}
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

let result = infiniteArray(arr: &arr, value: 1120)
print(result)


