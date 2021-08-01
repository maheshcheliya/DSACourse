import UIKit

var str = "A to I"
func myAtoi(_ s: String) -> Int {
    var number = ""

    for char in s {
        if(char == " " && number == "") {
            continue
        }

        if(char == "-" && number == "") {
            number = "-"
            continue
        }
        if(char == "+" && number == "") {
            number = "+"
            continue
        }

        if(!char.isNumber) {
            break
        }
        number = number + String(char)
    }
    if(number.count == 0) {
        return 0
    }

    let integerNumber = Decimal(string: number) ?? 0
    let power = pow(2, 31)

    if(integerNumber >= power) {
        let result = NSDecimalNumber(decimal: power)
        return result.intValue - 1
    }
    
    var negativePower = pow(2,31)
    negativePower.negate()

    if(integerNumber <= negativePower) {
        let result = NSDecimalNumber(decimal: negativePower)
        return result.intValue
    }

    return Int(number) ?? 0
}
let tests = [
            "42",
            "-42",
            "4193 with words",
            "words and 987",
            "-91283472332",
            "91283472331232",
            "     - 1 3 5 -",
            "+1",
            "+-12",
            "-+12",
            "2147483647",
            "-2147483648"]

for value in tests {
    print(myAtoi(value))
}
