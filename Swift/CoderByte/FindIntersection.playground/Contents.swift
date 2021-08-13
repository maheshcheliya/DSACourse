import UIKit

var str = "Hello, playground"
func FindIntersection(_ strArr: [String]) -> String {
    let firstString = strArr[0]
    let secondString = strArr[1]

    let firstStringArray = firstString.split(separator: Character(",")).map(String.init)
    let secondStringArray = secondString.split(separator: Character(",")).map(String.init)
    
    
    let firstIntegerArray = firstStringArray.map { Int($0.replacingOccurrences(of: " ", with: ""))! }
    
    let secondIntegerArray = secondStringArray.map { Int($0.replacingOccurrences(of: " ", with: ""))! }

    let set1 = Set(firstIntegerArray)
    let set2 = Set(secondIntegerArray)

    let result = set1.intersection(set2).sorted(by: {
        return $0 < $1
    })
    
    if result.count == 0 {
        return "false"
    }
    
    let stringResult = result.map { String($0) }.joined(separator: ",")

    return stringResult
}
//let arr = ["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]
let arr = ["1, 3, 9, 10, 17, 18", "1, 4, 9, 10"]
let res = FindIntersection(arr)
print(res)
