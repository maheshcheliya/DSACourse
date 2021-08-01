import UIKit

var str = "Books Allocation - Google Interview Question | Binary Search"
// we have to find minimum pages one student can read, with contigues manner book pages,
// for example, if we have array = [10,20,10,30], and student is 2
// then one student can read maximum pages, which is 40
// if student = 3, then the answer is 30, as 2 student

func minPages(arr: inout [Int], students: Int) -> Int {
    var min = maximumFromArray(arr: arr)
    var max = sumOfArray(arr: arr)
    // in this example, minimum and maximum is not the indices, it's values
    var result = 0
    
    while (min <= max) {
        let middle = (min + max) / 2
        if(isFeasible(arr: arr, student: students, res: middle)) {
            result = middle
            max = middle - 1
        } else {
            min = middle + 1
        }
    }
    return result
}
func isFeasible(arr: [Int], student : Int, res: Int) -> Bool {
    var totalStudent = 1
    var sum = 0
    for value in arr {
        if(sum + value > res) {
            totalStudent += 1
            sum = value
        } else {
            sum += value
        }
    }
    return totalStudent <= student
}
func maximumFromArray(arr: [Int]) -> Int {
    var maximum = Int.min
    
    for value in arr {
        if (value > maximum) {
            maximum = value
        }
    }
    return maximum
}
func sumOfArray(arr:[Int]) -> Int {
    var sum = 0
    for value in arr {
        sum += value
    }
    return sum
}
