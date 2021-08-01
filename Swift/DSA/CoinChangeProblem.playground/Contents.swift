
import UIKit
let str = "Minimum coins problem - Dynamic programming demo"
// find minimum coins required to get n amount with a coins

func minCoins(n : Int, a: [Int], storage: inout [Int]) -> Int {
    if(n == 0 ) { return 0; }
    var answer = Int.max
    for i in 0..<a.count {
        if(n - a[i] >= 0) {
            var subAns = 0
            if(storage[n-a[i]] != -1) {
                subAns = storage[n-a[i]]
            } else {
                subAns = minCoins(n: n - a[i], a: a, storage: &storage)
            }
            if(subAns + 1 < answer && subAns != Int.max) {
                answer = subAns + 1
            }
        }
    }
    storage[n] = answer
    return answer
}
var n = 245;
let a = [7,5,1, 20]
var storage = [Int](repeating: -1, count: n + 1) // this is for dynamic programming
storage[0] = 0
let answer = minCoins(n: n, a: a, storage: &storage)
print(answer)


