import UIKit
import PlaygroundSupport

// Start with first character, take s[0] character, that is 'n' in our case
// check it's left and right are same,
// if same then merge it, otherwise add it to the array

func partitions(_ str: String,_ currentArr: inout [String],_ arr: inout [[String]])
{
    if(str.count == 0) {
        arr.append(currentArr)
        currentArr.removeAll()
        return
    }

    for i in 0..<str.count {
        let prefix = substr(str, 0, i)
        let remainingString = substr(str, i+1, str.count - 1)
        if(isPalindrome(prefix)) {
            currentArr.append(prefix)
            partitions(remainingString, &currentArr, &arr)
        }
    }
}
func isPalindrome(_ s: String) ->  Bool {
    var last = s.count - 1
    for index in 0..<s.count/2 {
        if(charAtIndex(s, index) != charAtIndex(s, last)) {
            return false
        }
        last -= 1
    }
    return true
}

func charAtIndex(_ s: String,_ i: Int) -> String {
    if(i<0 || (i>=s.count)) {
        return ""
    }
    
    let index = s.index(s.startIndex, offsetBy: i)
    let limit = s.index(s.startIndex, offsetBy: i + 1)
    return String(s[index..<limit])
}
func substr(_ s: String,_ i: Int,_ j: Int) -> String {
    if(i<0 || i >= s.count || j<0 || j >= s.count) { return "" }
    let leftIndex = s.index(s.startIndex, offsetBy: i)
    let rightIndex = s.index(s.startIndex, offsetBy: j)
    return String(s[leftIndex...rightIndex])
}

var str = "wynitinyw"
var arr = [String]()
var result = [[String]]()
partitions(str, &arr, &result)
print(result)
