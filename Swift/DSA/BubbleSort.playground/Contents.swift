import UIKit

var str = "Bubble sort"

func bubbleSort(_ arr: inout [Int]) {
    var lastSorted = 0
    var isSorted = false
    while (lastSorted < arr.count ) {
        for i in 0..<arr.count - 1 - lastSorted {
            if(arr[i] > arr[i+1]) {
                arr.swapAt(i, i+1)
                isSorted = true
            }
        }
        lastSorted += 1
        if(!isSorted) {
            break
        }
    }
}

var arr = [2,4,1,5,88,76,2,0,23,4]
bubbleSort(&arr)
print(arr)


// Notes
// Pick each element and compare with it's next element, if next is greater than current, then swap those,
// Repeat this process from first element to last element,
// In first iteration, we will place highest element to the last position, so we don't need to go to end each time, so we will increase last sorted += 1,
// If we found each value is less than it's next, then isSorted remain false, so we can say that this array is sorted and we should break the main loop.

