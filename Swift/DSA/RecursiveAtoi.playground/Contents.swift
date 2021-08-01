import UIKit

var str = "Recursive a to i"

func atoi(_ s: String) -> Int {
    if s.count == 0 {
        return 0
    }
    
    let last = Int(substr(s, s.count - 1)) ?? 0
    let remaining = substr(s, 0, s.count - 1)
    let result = atoi(remaining) * 10 + last
    
    return result
}
let s = "-1254"
let val = atoi(s)
print(val)
func substr(_ s:String,_ i: Int,_ limit: Int = 1) -> String {
    let index = s.index(s.startIndex, offsetBy: i)
    let limit = s.index(s.startIndex, offsetBy: i + limit)
    return String (s[index..<limit])
}




// last = 4
// remaining = 125
// atoi(125) * 10 + 4 == what is atoi ? lets find it == 1250*10+4 = 12504

// last 5
// remaining = 12
// atoi(12) * 10 + 5 == what is atoi ? lets find it == 12*10 + 5 = 1250
// atoi(12) returned = 12


// last 2
// remaining = 1
// atoi(1) * 10 + 2 == what is atoi ? lets find it == (1*10)+2 = 12
// atoi(1) returned = 1

// last 1
// remaining = ""
// atoi("") * 10 + 1 == what is atoi ? lets find it == 0 * 10 + 1 = 1 - return
// atoi returned = 0

// atoi("") * 10 == string is empty so it will return zero == 0
