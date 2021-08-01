import UIKit

var str = "Hackerrank - Fraudulent Activity Notifications"

func activityNotifications(expenditure: [Int], d: Int) -> Int {
    var notificationCounter = 0
    var countArr = [Int](repeating: 0, count: 201)

    for i in 0..<d {
        countArr[expenditure[i]] += 1
    }
    
    for i in d..<expenditure.count {
        let median = findMedian(countArr: countArr, d: d)
        
        if (Int(2.0 * median) <= expenditure[i]) {
            notificationCounter += 1
        }
        countArr[expenditure[i-d]] -= 1
        countArr[expenditure[i]] += 1
    }
    return notificationCounter
}
func findMedian(countArr : [Int], d : Int) -> Double {
    var count = 0
    var result : Double = 0
    
    if(d % 2 != 0) {
        for i in 0..<countArr.count {
            count += countArr[i]
            if(count > d/2) {
                result = Double(i)
                break
            }
        }
    } else {
        var first = 0
        var second = 0
        for i in 0..<countArr.count {
            count += countArr[i]
            
            if(first == 0 && count >= d/2) {
                first = i
            }
            if(second == 0 && count >= d/2 + 1) {
                second = i
                break
            }
        }
        result = Double(first + second) / 2
    }
    return result
}


//let arr = [1, 2, 3, 4, 4]
//let d = 4
let arr = [2, 3, 4, 2, 3, 6, 8, 4, 5]
let d = 5
let result = activityNotifications(expenditure: arr, d: d)
print(result)

