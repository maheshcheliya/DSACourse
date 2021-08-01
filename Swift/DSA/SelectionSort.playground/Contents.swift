import UIKit

var str = "Selection Sort"
// find minimum and then swap with first element
func selectionSort(_ arr: inout [Int]) {
    for i in 0..<arr.count - 1 {
        var j = i + 1
        var minIndex = i
        while (j < arr.count) {
            if(arr[j] < arr[minIndex]) {
                minIndex = j
            }
            j += 1
        }
        if minIndex != i {
            arr.swapAt(i, minIndex)
        }
    }
}

var arr = [3,45,1,2,4,3,6,74]
selectionSort(&arr)
print(arr)
