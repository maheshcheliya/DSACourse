import UIKit
var str = "All Possible Strings of Length K"
func possibleStrings(_ s: [String],_ prefix: String, n: Int, _ k: Int) {
    if(k == 0) {
        print(prefix)
        return
    }
    var i = 0
    while(i<n) {
        let newPrefix = prefix + s[i]
        possibleStrings(s, newPrefix, n: n, k-1)
        i += 1
    }
}
var arr = ["a","b","c"]
var k = 3
possibleStrings(arr, "", n: arr.count, k)
