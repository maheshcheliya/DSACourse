import UIKit

var str = "Hello, playground"

func powerSet(_ str: String, _ i : Int, char: String, subsets: inout [String]){
    if(i >= str.count) {
        subsets.append(char)
        return
    }
    let character = charAtIndex(str, i)
    powerSet(str, i+1, char: char + character, subsets: &subsets)
    powerSet(str, i+1, char: char, subsets: &subsets)
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
let ss = "abc"
var subsets = [String]()
let char = charAtIndex(ss, 0)
powerSet(ss, 0, char: "", subsets: &subsets)
print(subsets)
