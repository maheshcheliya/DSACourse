import UIKit
var str = "Insertion Sort"

func insertionSort(_ arr: inout [Int]) {
    for i in 1..<arr.count {
        let temp = arr[i] // 4
        var j = i - 1 // 2
        while (j>=0 && arr[j] > temp) {
            arr[j+1] = arr[j]
            j -= 1
        }
        arr[j+1] = temp
    }
}
var arr = [5,1,4,6,12,68,45,2]
insertionSort(&arr)
print(arr)


// Notes

// Array will divide into two parts, first is sorted and second is unsorted
// Pick element from unsorted element, (at the start, we can say that first element is sorted, and all other elements are unsorted, so we will pick first element from unsorted array, which is at index - 1)
// assign temporary variable from picked index (first iteration, it will be index 1, so we are starting for loop from 1 to arr.count-1)
// then compare picked element and unsorted array last element, which is usually i-1, we assign j = i-1
// if element at index j is greater than temp, then will shift index j value to it's next
// NOTE-we are each value from left to right if that value is greater than temp
// As soon as we find index j value less than or equal to then we will place that value at j+1
// As our left array is sorted, all the value from index j value will be obiously less, so it is right position to place temp value their
// each time we will move from left to right,
// Each for loop iteration will place, unsorted array first value to it's right position using it's inner while loop.
// sorted array will increase in size, and unsorted array decrease in size with each for loop iteration
