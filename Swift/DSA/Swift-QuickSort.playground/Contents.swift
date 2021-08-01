import UIKit

var str = "Quick Sort"
func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
    if left >= right { return }
   
    let p = partition(&nums, left, right)
    quickSort(&nums, left, p - 1)
    quickSort(&nums, p, right)
}

func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
    
    let pivotIndex: Int = (left+right) / 2
    let pivot = nums[pivotIndex]
    var i = left
    var j = right

    while i <= j {
        
        while(i < nums.count && nums[i] < pivot) { i += 1 }
        
        while(j > 0  && nums[j] > pivot) { j -= 1 }
    
        if (i < j) {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
    return i
}
var arr = [4,1,6,2,5]
//var arr = [4,6,2,5,7,9,1,3,89]
quickSort(&arr, 0,arr.count - 1)
print(arr)


// Notes for partition function

// choose pivot,
// We choose middle element as pivot here, but we can choose any element, e.g. first, last or random
// Go through each element using while loop until i<=j,
// NOTE - if index i is greater than j, we have visited all the elements
// inside the main while loop
// move from left to right using i index, check if element at index i is lower than pivot, if lower, then increase i, otherwise stop there,
// move from right to left using j index, check if element at index j is greater than pivot, if higher increase j, otherwise stop there,
// -> NOTE - we are stopping at this point to find highest and lowest element from both side,
// now we have higher element at left side and lower element at right side, which should not be there
// then swap those both element from index i to j and j to i
// At the end of the main while loop, Pivot will find it's right position.

