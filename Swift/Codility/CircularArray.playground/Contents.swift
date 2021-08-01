import UIKit
var str = "Circular Array"

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    var newArr = A
    var index = 0
    var circularIndex = 0
    while (index < A.count) {
        circularIndex = index + K
        if circularIndex >= A.count {
            circularIndex = circularIndex - A.count
        }
        newArr[circularIndex] = A[index]
        index += 1
    }
    
    return newArr
}

var arr = [1,2,3,4]
arr = [3,8,9,7,6]
let result = solution(&arr, 4)
print(result)

// index 2 = na[0]=9, A[2]
// index 3 = na[1]=7, A[3]
// index 4 = na[2]=6, A[4]
// index 5 = na[3]=3, A[0] because index == count
// index 6 = na[4]=8, A[1]
        
//        1,2,3,4
// index = 0 + 4 = na[0]= 4, A[0] , because index == count
// index = 1 + 4 = na[1]= 4, A[1] ,
// index = 1 + 4 = na[1]= 4, A[1] ,

//
//An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
//
//The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.
//
//Write a function:
//
//public func solution(_ A : inout [Int], _ K : Int) -> [Int]
//
//that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.
//
//For example, given
//
//    A = [3, 8, 9, 7, 6]
//    K = 3
//the function should return [9, 7, 6, 3, 8]. Three rotations were made:
//
//    [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
//    [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
//    [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
//For another example, given
//
//    A = [0, 0, 0]
//    K = 1
//the function should return [0, 0, 0]
//
//Given
//
//    A = [1, 2, 3, 4]
//    K = 4
//the function should return [1, 2, 3, 4]
//
//Assume that:
//
//N and K are integers within the range [0..100];
//each element of array A is an integer within the range [−1,000..1,000].
//In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
//
