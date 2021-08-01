import UIKit

var str = "Hackerrank - Frequency Queries"

func freqQuery(queries: [[Int]]) -> [Int] {
    var freqArray = [Int]()
    var dict : [Int: Int] = [:]
    var valueDict : [Int: Int] = [:]
    
    for (index, array) in queries.enumerated() {
        if(array[0] == 1) {
            
            if let value = dict[array[1]] {
                if value > 0 {
                    if let value1 = valueDict[value] {
                        valueDict[value] = value1 > 0 ? value1 - 1 : 0
                    } else {
                        valueDict[value] = 1
                    }
                }
                
                if let value1 = valueDict[value + 1] {
                    valueDict[value + 1] = value1 + 1
                } else {
                    valueDict[value + 1] = 1
                }

                dict[array[1]] = value + 1
            } else {
                dict[array[1]] = 1
                
                if let value1 = valueDict[1] {
                    valueDict[1] = value1 + 1
                } else {
                    valueDict[1] = 1
                }
            }
            
        } else if (array[0] == 2) {
            if let value = dict[array[1]], value > 0 {
                
                if let value1 = valueDict[value] {
                    valueDict[value] = value1 > 0 ? value1 - 1 : 0
                }
                
                if value - 1 > 0
                {
                    if let value1 = valueDict[value - 1] {
                        valueDict[value - 1] = value1 + 1
                    }
                }
                
                dict[array[1]] = value - 1
            }
            
        } else if (array[0] == 3) {
            if let value = valueDict[array[1]], value > 0 {
                freqArray.append(1)
            } else {
                freqArray.append(0)
            }
        }
    }
    return freqArray
}

var query = [
    [1, 3],
    [2, 3],
    [3, 2],
    [1, 4],
    [1, 5],
    [1, 5],
    [1, 4],
    [3, 2],
    [2, 4],
    [3, 2],
]

//query = [ [1,5],[2,5],[1,5],[2,5],[1,5],[1,4]]

let result = freqQuery(queries: query)
print(result)


