import UIKit

var str = "Print each digit from character"
// this is for my understanding
func printEachDigitFromCharacter(arr: [Int]) {
    for value in arr {
        var digit = 0
        var remaining = value
        while (remaining > 0) {
            digit = remaining % 10
            remaining = remaining / 10
            print(digit)
        }
        print("=====")
    }
}
let arr2 = [42113,31132,31312,335654,7853,429,9542]
printEachDigitFromCharacter(arr: arr2)
