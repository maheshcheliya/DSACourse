import UIKit
func numberOfWaysNxMMatrix(n: Int, m : Int) -> Int {
    if (n == 1 || m == 1) {
        return 1
    }
    return numberOfWaysNxMMatrix(n: n-1, m: m) + numberOfWaysNxMMatrix(n: n, m: m - 1)
}
let result = numberOfWaysNxMMatrix(n: 5, m: 2)
print(result)

// problem: e.g. there are five people stading in 1 round
// if first person has a gun with him, he will kill person at the position of K
// then gun will go to the next person to the killed one
// it will repeat until person remain 1, find who will remain alive


func josephusProblem(_ n: Int, _ k: Int) -> Int {
    if (n == 1) {
        return 0
    }
    return (josephusProblem(n - 1, k) + k) % n
}

print(josephusProblem(5, 3))
