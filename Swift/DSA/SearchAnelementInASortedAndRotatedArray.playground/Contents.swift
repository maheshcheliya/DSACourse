import UIKit

var str = "Search an element in a Sorted & Rotated Array | Binary Search"
var arr = [1,4,5,5,7,9,10,22,45,65,452,675,897,1120,1323,3132,4331,31311]

// this will only work sorted array or sorted and rotated ,
// for example , 6,7,1,2,4

func modifiedBinary(arr: inout [Int], value : Int) -> Int {
    var low = 0
    var high = arr.count - 1
    
    while (low <= high) {
        let middle = (low + high) / 2
        if(value == arr[middle]) {
            return middle
        }
        
        // if we find first element (arr[low]) is less than middle element,
        // then we are sure that left side array is sorted, and right side is sorted with rotated
        // if this condition is false, then we are sure that right side array is sorted
        //
        
        if(arr[low] < arr[middle]) {
            
            // now we have to check if value is in range from low to middle,
            // if it is true, then we will set high to middle - 1
            // because now we are sure here that the element is between low to middle, so if we set high = middle -1, then we can easily find that element as our regular binary search algorithm

            if(value >= arr[low] && value < arr[middle]) {
                high = middle - 1
            } else {
                low = middle + 1
            }
        } else {
            if(value > arr[middle] && value <= arr[high]) {
                low = middle + 1
            } else {
                high = middle - 1
            }
        }
    }
    return -1
}
