import Foundation
var str = "Find all permutations of a given string"
func permutation(_ s: inout String,_ left: Int,_ right:Int,_ arr: inout [String]) {
    if(left == right) {
        arr.append(s)
        return
    }
    for index in left...right {
        s = mySwap(s, left, index)
        permutation(&s, left + 1, right, &arr)
        s = mySwap(s, left, index)
    }
}
func mySwap(_ s: String,_ left: Int,_ right: Int) -> String {
    let leftChar = charAtIndex(s, left)
    let rightChar = charAtIndex(s, right)
    var newString = ""
    
    for (index, value) in s.enumerated() {
        if(index == left) {
            newString.append(rightChar)
        } else if (index == right) {
            newString.append(leftChar)
        } else {
            newString.append(value)
        }
    }
    return newString
}

func charAtIndex(_ s: String,_ i:Int) -> String {
    let startIndex = s.index(s.startIndex, offsetBy: i)
    let startLimit = s.index(s.startIndex, offsetBy: i + 1)
    let subStr = s[startIndex..<startLimit]
    return String(subStr)
}

var input = "abc"
var arr = [String]()
permutation(&input, 0, input.count - 1, &arr)
print(arr)
