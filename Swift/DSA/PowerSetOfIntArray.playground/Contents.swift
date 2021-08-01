import UIKit
var str = "Power set of integer array"
func dfs(i : Int, num: [Int], current : inout [Int], subset: inout [[Int]]) -> [[Int]] {
    if(i >= num.count) {
        subset.append(current)
        return subset
    }

    current.append(num[i])
    dfs(i: i + 1, num: num, current: &current, subset: &subset)
    current.removeLast()
    
    dfs(i: i + 1, num: num, current: &current, subset: &subset)

    return subset
}
let num = [1,2,3]
var subSet = [[Int]]()
var current = [Int]()
let result = dfs(i: 0, num: num, current: &current, subset: &subSet)
print(result)


// NOTES

// dfs, i = 0, num=123, current=[], subset=[[]]
// i >= count, false, move ahead
// append num[0]=1 element in current, current = [1]

// call dfs with, i = 1, current=[1], subset=[[]]
// i,1>= count,3, false, move ahead
// append num[1] = 2 in current, current = [1,2]

// call dfs with, i = 2, current=[1,2], subset=[[]]
// i,2>= count,3, false, move ahead
// append num[2] = 3 in current, current = [1,2,3]

// call dfs with, i = 3, current=[1,2,3], subset=[[]]
// i,3 >= count,3, true,
// append current in subset, subset = [[1,2,3]]

// return back to the previous call,
// with i = 2, current is still=[1,2,3] and subset = [[1,2,3]]
// remove last from current, current = [1,2]

// call dfs with i = 3, current = [1,2] and subset = [[1,2,3]]
// check i>=count, true,
// append current to subset = [[1,2,3],[1,2]]

// return back to the previous call,
// with i = 1, current = 1,2, subset = [[1,2,3],[1,2]]
// remove last from current, current = [1]

// call dfs with i + 1 = 2, current=[1], subset = [[1,2,3],[1,2]]
// i,2 >= count,3, false, move ahead
// append num[i] = 3 in current = [1,3]

// call dfs with i = 3, current = 1,3, dfs=[1,2,3], [1,2]
// i >= count, true
// append current = 1,3 to subset = 1,2,3-1,2-1,3

// return back to previous call,
// with i = 2, current = [1,3]
// remove last from current = [1]

// call dfs with i = 3, current = [1], subset = [[1,2,3],[1,2],[1,3]]
// i,3 >= count,3,
// append current=[1] to subset = subset = [[1,2,3],[1,2],[1,3],[1]]

