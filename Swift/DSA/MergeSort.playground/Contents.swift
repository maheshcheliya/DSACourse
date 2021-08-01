import UIKit

var str = "Merge sort"
func mergeSort(_ array :[Int]) -> [Int] {
    
    guard array.count > 1 else { return  array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}
func merge(_ left: [Int], _ right:[Int]) -> [Int] {
    var orderedArray = [Int]()
    
    var i = 0
    var j = 0
    
    while (i < left.count && j < right.count) {
        if(left[i] < right[j]) {
            orderedArray.append(left[i])
            i += 1
        } else {
            orderedArray.append(right[j])
            j += 1
        }
    }
    
    while (i < left.count) {
        orderedArray.append(left[i])
        i += 1
    }
    while (j < right.count) {
        orderedArray.append(right[j])
        j += 1
    }
    
    return orderedArray
}
var arr = [4,31,56,6,7,9,1,45,97,5]
arr = [1, 2, 1, 3, 2]
let result = mergeSort(arr)
print("result: \(result)")
