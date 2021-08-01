import UIKit

//Palindrome

func palindrome(str : inout String) -> Bool {
    if (str.count <= 1) {
        return true
    }
    if(str.first != str.last) {
        return false
    }
    str.removeFirst()
    str.removeLast()
    return palindrome(str: &str)
}


var str = "cabcfcbac"
let result = palindrome(str: &str)
print(result)

func palindrome(str: String, start: inout Int, end: inout Int) -> Bool {
    if str.count <= 0 {
        return false
    }
    if (start >= end) {
        return true
    }
    let startIndex = str.index(str.startIndex, offsetBy: start)
    let startLimit = str.index(str.startIndex, offsetBy: start + 1)

    let endIndex = str.index(str.startIndex, offsetBy: end - 1)
    let endLimit = str.index(str.startIndex, offsetBy: end)

    if(str[startIndex..<startLimit] != str[endIndex..<endLimit]) {
        return false
    }
    start += 1
    end -= 1
    return palindrome(str: str, start: &start, end: &end)
}
func charAtIndex(_ s: String, _ i: Int) -> String {
    if i >= s.count {
        return ""
    }
    let startIndex = s.index(s.startIndex, offsetBy: i)
    let startLimit = s.index(s.startIndex, offsetBy: i + 1)
    let char = s[startIndex..<startLimit]
    return String(char)
}




str = "abccba"
var start = 0
var end = str.count

let finalResult = palindrome(str: str, start: &start, end: &end)
print(finalResult)


